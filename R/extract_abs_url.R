#' Extract an absolute/full URL from a piece of text
#'
#' The text can be messy :-)
#' @param text one line of text
#' @return one single URL without a trailing slash
#' @export
#' @examples
#' text <- paste0(
#'   "[Introduction to Bianca: Handling Sensitive Research Data ",
#'   "<br> _September 18 2026_](https://uppmax.github.io/bianca_workshops/",
#'   "beginner/intro/){ .md-button .md-button--primary }"
#' )
#' extract_abs_url(text) # https://uppmax.github.io/bianca_workshops
extract_abs_url <- function(text) {
  testthat::expect_equal(1, length(text))
  matches <- stringr::str_match(text, "https://[A-Za-z\\._/]+[A-Za-z\\._]")
  testthat::expect_equal(1, nrow(matches))
  testthat::expect_equal(1, ncol(matches))
  matches[1][1]
}
