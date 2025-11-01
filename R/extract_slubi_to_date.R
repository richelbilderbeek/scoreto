#' Extract the to date from an SLUBI courses text
#' @param english_date_range a data range in English
#' @export
extract_slubi_to_date <- function(english_date_range) {

  testthat::expect_equal(1, length(english_date_range))

  english_to_date <- scoreto::extract_english_to_date(english_date_range)

  scoreto::convert_english_date_to_iso_8601(english_to_date)


}
