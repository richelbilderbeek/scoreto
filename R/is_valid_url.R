#' Determine if the URL is correctly formatted.
#'
#' It does not check if the URL exists
#' @param url a URL
#' @return TRUE if the URL has a valid format
#' @export
is_valid_url <- function(url) {
  testthat::expect_equal(1, length(url))
  matches <- stringr::str_match(url, "^https://[A-Za-z0-9-\\._/]+$")
  !is.na(matches[1, 1])
}
