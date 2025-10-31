#' Extract the from dates from an SLUBI courses text
#' @param slubi_courses_text subset of raw HTML from the SLUBI website.
#' @export
extract_slubi_from_dates <- function(slubi_courses_text) {


  stringr::str_subset(
    slubi_courses_text,
    stringr::regex("Nov.*\n</div>", multiline = TRUE)
  )

  stringr::str_subset(
    slubi_courses_text,
    stringr::regex("<div class=\"metadata-value listing-start\">\n.*\n</div>", multiline = TRUE)
  )





  # Nov 29, 2021
  slubi_dates <- stringr::str_subset(
    slubi_courses_text,
    "[A-Z][a-z]{2} [0-9]{1,2}, 20[:digit:]{2}"
  )
  testthat::expect_equal(0, sum(is.na(slubi_dates)))

  day <- stringr::str_match(slubi_dates, "^[A-Z][a-z]{1,2} ([:digit:]+)")[, 2]
  day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])
  testthat::expect_true(all(2 == nchar(day)))

  month_str <- stringr::str_match(
    slubi_dates,
    "[:upper:][:lower:]+"
  )[, 1]
  month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
  month[nchar(month) == 1] <- paste0(
    "0", month[nchar(month) == 1]
  )
  testthat::expect_true(all(2 == nchar(month)))

  year <- stringr::str_match(
    slubi_dates,
    "[:digit:]{4}$"
  )[, 1]
  year[is.na(year)] <- lubridate::year(lubridate::today())

  paste0(year, "-", month, "-", day)
}
