#' @title GeomHurricane
#' @description
#' This constructs the ggproto object necessary to display the hurricane radii
#' plots.
#' @import ggplot2
#' @importFrom dplyr select
#' @importFrom dplyr mutate
#' @importFrom dplyr left_join
#' @importFrom dplyr group_by_
#' @importFrom dplyr summarise
#' @importFrom dplyr ungroup
#' @importFrom dplyr filter
#' @importFrom dplyr bind_rows
#' @importFrom dplyr bind_cols
#' @importFrom dplyr rename
#' @importFrom tidyr gather
#' @importFrom grid polygonGrob
#' @importFrom grid gpar
#' @importFrom geosphere destPoint
#'
#'
#' @export
GeomHurricane <- ggplot2::ggproto("GeomHurricane", Geom,
                         required_aes = c("x","y","r_ne","r_se","r_nw","r_sw"),
                         default_aes = aes(scale_radii=1.0,
                                           alpha=0.75),
                         draw_key = draw_key_polygon,
                         draw_group = function(data, panel_scales, coord) {

                           angle_df <- data_frame(direction=rep(c("r_ne","r_se","r_sw","r_nw"),each=91),
                                                  angle=c(360,1:90,90:180,180:270,270:360))

                           data <-data %>%
                             dplyr::select(x, y, r_ne, r_nw, r_se, r_sw, colour, fill,
                                           PANEL, group, scale_radii, alpha) %>%
                             tidyr::gather(direction, distance, -x, -y, -colour, -fill,
                                           -PANEL, -group, -scale_radii, -alpha) %>%
                             dplyr::mutate(distance = distance * 1852 * scale_radii) %>%
                             dplyr::left_join(angle_df, by ="direction")

                           origin_data <- data %>%
                             dplyr::select(-distance) %>%
                             dplyr::group_by_(.dots=setdiff(names(data),c("distance","angle"))) %>%
                             dplyr::summarise(distance=0,angle=0) %>%
                             dplyr::ungroup()

                           data_r_ne <- data %>%
                             dplyr::filter(direction=="r_ne") %>%
                             dplyr::bind_rows(origin_data)
                           data_r_nw <- data %>%
                             dplyr::filter(direction=="r_nw") %>%
                             dplyr::bind_rows(origin_data)
                           data_r_se <- data %>%
                             dplyr::filter(direction=="r_se") %>%
                             dplyr::bind_rows(origin_data)
                           data_r_sw <- data %>%
                             dplyr::filter(direction=="r_sw") %>%
                             dplyr::bind_rows(origin_data)
                           data <- data_r_ne %>%
                             dplyr::bind_rows(data_r_nw,data_r_se,data_r_sw)

                           data <- data %>%
                             dplyr::bind_cols(as.data.frame(geosphere::destPoint(cbind(data$x,data$y),
                                                                                 b=data$angle,
                                                                                 d=data$distance))) %>%
                             dplyr::select(-x,-y) %>%
                             dplyr::rename(x=lon,y=lat)

                           coords <- coord$transform(data, panel_scales)

                           grid::polygonGrob(
                             x = coords$x,
                             y = coords$y,
                             gp = grid::gpar(col = coords$colour,
                                       fill = coords$fill,
                                       alpha = coords$alpha,
                                       lty="solid", lwd=2)
                            )
                          }
                         )

#' @title geom_hurricane
#' @description
#' Generates a radii plot on a ggmap object representing the maximum windspeed
#' @inheritParams ggplot2::geom_polygon
#' @param scale_radii Numeric value to adjust scale of the radii plot.
#' @examples
#' \dontrun{
#' get_map("Louisiana", zoom = 6, maptype = "toner-background", source="stamen",force=FALSE) %>%
#'     ggmap(extent = "device") +
#'     geom_hurricane(data = katrina_observation,
#'                    aes(x = longitude, y = latitude,
#'                        r_ne = ne, r_se = se, r_nw = nw, r_sw = sw,
#'                        fill = wind_speed, color = wind_speed,
#'                        scale_radii=0.75)) +
#'     scale_color_manual(name = "Wind speed (kts)",
#'                        values = c("red", "orange", "yellow")) +
#'     scale_fill_manual(name = "Wind speed (kts)",
#'                       values = c("red", "orange", "yellow"))
#' }
#' @import ggplot2
#'
#' @export
geom_hurricane <- function(mapping = NULL, data = NULL, stat = "identity",
                           position = "identity", na.rm = FALSE, show.legend = NA,
                           inherit.aes = TRUE, scale_radii = 1.0, ...) {
  layer(
    geom = GeomHurricane, mapping = mapping,  data = data, stat = stat,
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}
