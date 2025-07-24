#' Are all the dates correctly formatted?
#' @param date_strs strings for dates
#' @return TRUE if all the strings follows a `YYYY-MM-DD` format
#' @note this does not test the value of the strings
#' @export
are_correctly_formatted_dates <- function(date_strs) {
  all(scoreto::is_correctly_formatted_date(date_strs))
}
