#' Convert one or more dates written in English
#' to the ISO 8601 `YYYY-MM-DD` format
#' @param english_date a date in Enlish
#' @return one or more strings in `YYYY-MM-DD` format
#' @examples
#' convert_english_dates_to_iso_8601("25 November 2025") # 2025-11-25
#' @export
convert_english_dates_to_iso_8601 <- function(english_dates) {
  testthat::expect_true(length(english_dates) > 0)
  testthat::expect_true(is.character(english_dates))
  iso_dates <- as.character(
    Vectorize(convert_english_date_to_iso_8601)(english_dates)
  )
  testthat::expect_equal(length(english_dates), length(iso_dates))
  iso_dates
}
