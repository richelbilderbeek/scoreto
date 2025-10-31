#' Extract the from date from an SLUBI courses text
#' @param english_from_date subset of raw HTML from the SLUBI website.
#' @export
extract_slubi_from_date <- function(english_from_date) {
  testthat::expect_equal(1, length(english_from_date))

  raw_english_from_date <- english_from_date
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, "-", "")
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, ",.*,", " ")
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, ",", " ")
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, "&", " ")
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, "rd", "")
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, "nd", "")
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, "th", "")
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, "st", "")
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, "  ", " ")
  raw_english_from_date <- stringr::str_replace_all(raw_english_from_date, " $", "")
  english_from_date <- raw_english_from_date

  scoreto::convert_english_date_to_iso_8601(english_from_date)
}
