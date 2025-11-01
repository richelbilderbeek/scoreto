#' Convert one dates written in English
#' to the ISO 8601 `YYYY-MM-DD` format
#' @param english_date a date in Enlish
#' @return one string in `YYYY-MM-DD` format
#' @examples
#' convert_english_date_to_iso_8601("25 November 2025") # 2025-11-25
#' @export
convert_english_date_to_iso_8601 <- function(english_date) { # nolint a long function name is fine
  testthat::expect_equal(1, length(english_date))
  testthat::expect_true(is.character(english_date))

  month <- NA
  day <- NA
  year <- NA

  # 25 November 2025
  if (
    stringr::str_detect(
      english_date,
      "^[:digit:]{1,2} [:upper:][:lower:]+ [:digit:]{1,4}$"
    )
  ) {
    month_str <- stringr::str_match(english_date, "([:upper:][:lower:]+)")[, 2]
    month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
    month[nchar(month) == 1] <- paste0("0", month[nchar(month) == 1])

    day <- stringr::str_match(english_date, "([:digit:]{1,2})")[, 2]
    day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])

    year <- stringr::str_match(english_date, "([:digit:]{4})")[, 2]
  } else if ( # September/October 2025
    stringr::str_detect(
      english_date,
      "^[:upper:][:lower:]+/[:upper:][:lower:]+ [:digit:]{1,4}$"
    )
  ) {
    # Will take the first month
    month_str <- stringr::str_match(english_date, "([:upper:][:lower:]+)")[, 2]
    month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
    month[nchar(month) == 1] <- paste0("0", month[nchar(month) == 1])

    # Will take the first day of the first month
    day <- "01"

    year <- stringr::str_match(english_date, "([:digit:]{4})")[, 2]
  } else if ( # Nov 3 2025
    stringr::str_detect(
      english_date,
      "^[:upper:][:lower:]{2} [:digit:]+ [:digit:]{1,4}$"
    )
  ) {
    # Will take the first month
    month_str <- stringr::str_match(english_date, "([:upper:][:lower:]+)")[, 2]
    month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
    month[nchar(month) == 1] <- paste0("0", month[nchar(month) == 1])

    # Will take the first day of the first month
    day <- stringr::str_match(english_date, " ([:digit:]+) ")[, 2]
    day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])

    year <- stringr::str_match(english_date, "([:digit:]{4})")[, 2]
  }  else if ( # Nov 3
    stringr::str_detect(
      english_date,
      "^[:upper:][:lower:]{2} [:digit:]+$"
    )
  ) {
    # Will take the first month
    month_str <- stringr::str_match(english_date, "([:upper:][:lower:]+)")[, 2]
    month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
    month[nchar(month) == 1] <- paste0("0", month[nchar(month) == 1])

    # Will take the first day of the first month
    day <- stringr::str_match(english_date, "([:digit:]+)")[, 2]
    day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])

    year <- lubridate::year(lubridate::today())
  }

  testthat::expect_false(is.na(day))
  testthat::expect_false(is.na(month))
  testthat::expect_false(is.na(year))
  testthat::expect_equal(nchar(day), 2)
  testthat::expect_equal(nchar(month), 2)
  testthat::expect_equal(nchar(year), 4)
  paste0(year, "-", month, "-", day)
}
