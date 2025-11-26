#' Extract an English range from a piece of text
#' @param text one line of text
#' @return the English range
#' @export
extract_english_range <- function(text) {
  testthat::expect_equal(1, length(text))

  # Date:27-28 November
  result <- stringr::str_match(
    text,
    "Date:[:blank:]?([:digit:]+[:blank:][:upper:][:lower:]+[:blank:][:digit:]{4})" # nolint
  )[, 2]
  if (!is.na(result)) {
    return(result)
  }

  # Date:27-28 November
  result <- stringr::str_match(
    text,
    "Date:[:blank:]?([:digit:]+-[:digit:]+[:blank:][:upper:][:lower:]+[:blank:][:digit:]{4})" # nolint
  )[, 2]
  if (!is.na(result)) {
    return(result)
  }

  # Date:27-28 November & 1-2 December 2025
  result <- stringr::str_match(
    text,
    paste0(
      "Date:[:blank:]?",
      "([:digit:]+-[:digit:]+[:blank:][:upper:][:lower:]+",
      "[:blank:]&[:blank:][:digit:]+-[:digit:]+[:blank:][:upper:][:lower:]+",
      "[:blank:][:digit:]{4})"
    )

  )[, 2]
  testthat::expect_true(!is.na(result))
  result
}

