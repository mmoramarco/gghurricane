context("geom-hurricane")


# Visual tests ------------------------------------------------------------
library(ggmap)
library(dplyr)
test_that("geom_hurricane draws correctly", {
  katrina_plot <- get_map("Louisiana", zoom = 6,
                          maptype = "toner-background",
                          source="stamen",force=FALSE) %>%
      ggmap(extent = "device") +
      geom_hurricane(data = katrina_observation,
                     aes(x = longitude, y = latitude,
                         r_ne = ne, r_se = se, r_nw = nw, r_sw = sw,
                         fill = wind_speed, color = wind_speed,
                         scale_radii=0.75)) +
      scale_color_manual(name = "Wind speed (kts)",
                         values = c("red", "orange", "yellow")) +
      scale_fill_manual(name = "Wind speed (kts)",
                        values = c("red", "orange", "yellow"))
  vdiffr::expect_doppelganger("geom hurricane katrina",katrina_plot,"")
})
