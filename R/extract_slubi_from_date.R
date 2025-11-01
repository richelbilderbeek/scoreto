#' Extract the from date from an SLUBI courses text
#' @param english_date_range a data range in English
#' @export
#' @examples
#' extract_slubi_from_date("Nov 07th - Nov 25th, 2022")
#'
extract_slubi_from_date <- function(english_date_range) {
  testthat::expect_equal(1, length(english_date_range))

  english_from_date <- scoreto::extract_english_from_date(english_date_range)

  scoreto::convert_english_date_to_iso_8601(english_from_date)
}
