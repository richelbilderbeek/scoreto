#' Extract a relative URL from a piece of text
#'
#' The text can be messy :-)
#' @param text one line of text
#' @return one single relative URL without a trailing slash
#' @export
#' @examples
#' text <- paste0(
#'   "<p><a class=\"md-button md-button--primary\" ",
#'   "href=\"../uppmax_intro_course/\">Introduction to Linux and ",
#'   "UPPMAX <br> <em>August 24-26 2026</em></a></p>"
#' )
#' extract_rel_url(text) # ../uppmax_intro_course
extract_rel_url <- function(text) {
  testthat::expect_equal(1, length(text))
  # Assume a href
  matches <- stringr::str_match(text, "href=\\\"([A-Za-z\\._/]+[A-Za-z\\._])")
  testthat::expect_equal(1, nrow(matches))
  testthat::expect_equal(2, ncol(matches))
  if (is.na(matches[1, 2])) {
    # Assume a Markdown link
    matches <- stringr::str_match(text, "\\[.*\\]\\(([A-Za-z\\._]+)\\)")
    testthat::expect_equal(1, nrow(matches))
    testthat::expect_equal(2, ncol(matches))
  }
  else
  {
    # We have a href
    # Absolute URLs are not welcome
    if (!is.na(scoreto::extract_abs_url(text))) {
      return(NA)
    }
  }
  matches[1, 2]
}
