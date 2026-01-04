#' Extract an English range from a piece of text
#'
#' The text can be messy :-)
#' @param text one line of text
#' @return the English range
#' @export
#' @examples
#' extract_english_range("<p>event 15th Apr 2025</p></li>") # 15th Apr 2025
extract_english_range <- function(text) {
  testthat::expect_equal(1, length(text))

  # Fix human errors
  text <- stringr::str_replace(text, "November2025", "November 2025")
  text <- stringr::str_replace(text, "December2025", "December 2025")


  patterns <- c(
    # Date:27 November
    "Date:[:blank:]?([:digit:]+[:blank:][:upper:][:lower:]+[:blank:][:digit:]{4})", # nolint
    # Date:27-28 November
    "Date:[:blank:]?([:digit:]+-[:digit:]+[:blank:][:upper:][:lower:]+[:blank:][:digit:]{4})", # nolint
    # Date:27-28 November & 1-2 December 2025
    paste0(
      "Date:[:blank:]?",
      "([:digit:]+-[:digit:]+[:blank:][:upper:][:lower:]+",
      "[:blank:]&[:blank:][:digit:]+-[:digit:]+[:blank:][:upper:][:lower:]+",
      "[:blank:][:digit:]{4})"
    ),
    # March 10, 2026
    "([:upper:][:lower:]+[:blank:][:digit:]{1,2},[:blank:][:digit:]{4})",
    # 9th Sep 2025
    # 3rd Oct 2025
    "([:digit:]{1,2}(th|rd)[:blank:][:upper:][:lower:]+[:blank:][:digit:]{4})",
    # Oct. 9th, 2025
    "([:upper:][:lower:]+\\.[:blank:][:digit:]{1,2}th,[:blank:][:digit:]{4})"
  )
  for (pattern in patterns) {
    result <- stringr::str_match(text, pattern)[, 2]
    if (!is.na(result)) {
      break
    }
  }

  testthat::expect_true(!is.na(result))
  full_months_pattern <- "(January|February|March|April|May|June|July|August|September|October|November|December)" # nolint
  short_months_pattern <- "(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)"
  testthat::expect_true(
    all(
      stringr::str_detect(result, full_months_pattern) |
        stringr::str_detect(result, short_months_pattern)
    )
  )
  result
}
