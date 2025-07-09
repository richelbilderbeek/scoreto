#' Extract the 'to' date from one or more UPPMAX dates
#' @param uppmax_date_range a UPPMAX date range
#' @return a string in `YYYY-MM-DD` format
#' @examples
#' extract_uppmax_to_dates("Aug 25-27") # 2025-08-27
#' extract_uppmax_to_dates("Oct 14") # 2025-10-14
#' extract_uppmax_to_dates("Oct 23-24 + 27-29") # 2025-10-29
#' @export
extract_uppmax_to_dates <- function(uppmax_date_ranges) {
  as.character(
    Vectorize(extract_uppmax_to_date)(uppmax_date_ranges)
  )
}
