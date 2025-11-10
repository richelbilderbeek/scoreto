#' Extract the from dates from an CSC date ranges
#' @param csc_date_ranges date ranges as used at the CSC website.
#' @return from date in ISO 8601 format
#' @export
#' @examples
#' extract_csc_from_dates("18.-20.11.2025")
#' extract_csc_from_dates("25.11.2025")
#' extract_csc_from_dates("25.-27.11.2025")
#' extract_csc_from_dates("2.-4.12.2025")
extract_csc_from_dates <- function(csc_date_ranges) {
  as.character(Vectorize(scoreto::extract_csc_from_date)(csc_date_ranges))

}
