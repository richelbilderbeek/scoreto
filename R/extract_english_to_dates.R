#' Extract the English to dates from English date ranges
#' @param english_date_ranges English date ranges
#' @export
extract_english_to_dates <- function(english_date_ranges) {
  testthat::expect_true(length(english_date_ranges) > 0)
  as.character(Vectorize(scoreto::extract_english_to_date)(english_date_ranges))
}
