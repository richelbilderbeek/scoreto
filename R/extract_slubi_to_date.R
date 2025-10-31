#' Extract the to date from an SLUBI courses text
#' @param english_date a datte from the SLUBI website.
#' @export
extract_slubi_to_date <- function(english_to_date) {
  testthat::expect_equal(1, length(english_to_date))
  raw_english_to_date <- english_to_date
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, "[:digit:]+-", "")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, "and ", "")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, ",.*,", " ")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, ",", " ")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, "&", " ")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, "rd", "")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, "nd", "")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, "th", "")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, "st", "")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, "  ", " ")
  raw_english_to_date <- stringr::str_replace_all(raw_english_to_date, " $", "")
  english_to_date <- raw_english_to_date
  scoreto::convert_english_date_to_iso_8601(english_to_date)
}
