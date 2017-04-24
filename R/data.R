#' The Tropical Cyclone Extended Best Track Dataset
#'
#' @source Regional and Mesocale Meteorology Branch of Colorado
#' State University. \url{http://rammb.cira.colostate.edu/research/tropical_cyclones/tc_extended_best_track_dataset/}
#' @format A data frame with columns:
#' \describe{
#'  \item{storm_id}{Storm ID.}
#'  \item{storm_name}{Storm name.}
#'  \item{month}{Month.}
#'  \item{day}{Day.}
#'  \item{hour}{Hour.}
#'  \item{year}{Year.}
#'  \item{latitude}{Latitude.}
#'  \item{longitude}{Longitude.}
#'  \item{max_wind}{Maximum wind speed.}
#'  \item{min_pressure}{Minimum pressure.}
#'  \item{rad_max_wind}{Radius of maximum wind.}
#'  \item{eye_diameter}{Eye diamter.}
#'  \item{pressure_1}{Pressure 1.}
#'  \item{pressure_2}{Pressure 2.}
#'  \item{radius_34_ne}{Radius.}
#'  \item{radius_34_se}{Radius.}
#'  \item{radius_34_sw}{Radius.}
#'  \item{radius_34_nw}{Radius.}
#'  \item{radius_50_ne}{Radius.}
#'  \item{radius_50_se}{Radius.}
#'  \item{radius_50_sw}{Radius.}
#'  \item{radius_50_nw}{Radius.}
#'  \item{radius_64_ne}{Radius.}
#'  \item{radius_64_se}{Radius.}
#'  \item{radius_64_sw}{Radius.}
#'  \item{radius_64_nw}{Radius.}
#'  \item{storm_type}{Storm type.}
#'  \item{distance_to_land}{Distance to land.}
#'  \item{final}{Final.}
#' }
#' @examples
#' \dontrun{
#'  ext_tracks
#' }
"ext_tracks"

#' A Single Observation of Hurricane Ike
#'
#' @source Regional and Mesocale Meteorology Branch of Colorado
#' State University. \url{http://rammb.cira.colostate.edu/research/tropical_cyclones/tc_extended_best_track_dataset/}
#' @format A data frame with columns:
#' \describe{
#'  \item{storm_id}{Storm Name and Year}
#'  \item{date}{Date.}
#'  \item{latitude}{Latitude.}
#'  \item{longitude}{Longitude.}
#'  \item{wind_speed}{Wind Speed}
#'  \item{ne}{Radius of wind speed.}
#'  \item{nw}{Radius of wind speed.}
#'  \item{se}{Radius of wind speed.}
#'  \item{sw}{Radius of wind speed.}
#' }
#' @examples
#' \dontrun{
#'  ike_observation
#' }
"ike_observation"

#' A Single Observation of Hurricane Katrina
#'
#' @source Regional and Mesocale Meteorology Branch of Colorado
#' State University. \url{http://rammb.cira.colostate.edu/research/tropical_cyclones/tc_extended_best_track_dataset/}
#' @format A data frame with columns:
#' \describe{
#'  \item{storm_id}{Storm Name and Year}
#'  \item{date}{Date.}
#'  \item{latitude}{Latitude.}
#'  \item{longitude}{Longitude.}
#'  \item{wind_speed}{Wind Speed}
#'  \item{ne}{Radius of wind speed.}
#'  \item{nw}{Radius of wind speed.}
#'  \item{se}{Radius of wind speed.}
#'  \item{sw}{Radius of wind speed.}
#' }
#' @examples
#' \dontrun{
#'  katrina_observation
#' }
"katrina_observation"

