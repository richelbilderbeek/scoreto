#' Extract the English from dates from English date ranges
#' @param english_date_ranges English date ranges
#' @export
extract_english_from_dates <- function(english_date_ranges) {
  testthat::expect_true(length(english_date_ranges) > 0)
  as.character(
    Vectorize(scoreto::extract_english_from_date)(english_date_ranges)
  )
}
