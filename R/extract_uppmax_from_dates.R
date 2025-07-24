#' Extract the 'from' date
#' @param uppmax_date_ranges one or more UPPMAX date ranges
#' @return a string in `YYYY-MM-DD` format
#' @examples
#' extract_uppmax_from_dates("Aug 25-27") # 2025-08-25
#' extract_uppmax_from_dates("Oct 14") # 2025-10-14
#' extract_uppmax_from_dates("Oct 23-24 + 27-29") # 2025-10-23
#' @export
extract_uppmax_from_dates <- function(uppmax_date_ranges) {
  as.character(
    Vectorize(scoreto::extract_uppmax_from_date)(uppmax_date_ranges)
  )
}
