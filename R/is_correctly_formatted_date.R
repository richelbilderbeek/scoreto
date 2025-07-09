#' Is the date correctly formatted?
#' @param date_str a string for a date
#' @return TRUE if the string follows a `YYYY-MM-DD` format
#' @note this does not test the value of the string
#' @export
is_correctly_formatted_date <- function(date_str) {
  stringr::str_detect(
    date_str,
    "^[:digit:]{4}-[:digit:]{2}-[:digit:]{2}$"
  )
}
