#' Extract the to date from an English range
#' @param english_date_range a date range in English
#' @export
#' @examples
#' extract_english_to_date("Nov 07th - Nov 25th, 2022")
extract_english_to_date <- function(english_date_range) {

  testthat::expect_equal(1, length(english_date_range))

  year <- scoreto::get_last_row(
    stringr::str_match_all(
      english_date_range,
      "([:digit:]{4})"
    )[[1]]
  )[2]

  month <- scoreto::get_last_row(
    stringr::str_match_all(
      english_date_range,
      "([:upper:][:lower:]+)"
    )[[1]]
  )[2]

  day <- scoreto::get_last_row(
    stringr::str_match_all(
      english_date_range,
      "([:digit:]{1,2})([:lower:])?[^[:digit:]]"
    )[[1]]
  )[2]

  paste(day, month, year)
}
