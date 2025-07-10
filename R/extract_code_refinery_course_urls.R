#' Extract the URL of a course from an Code Refinery courses text
#' @param text subset of raw HTML
#'   from the Code Refinery website.
#' @return a collection of strings and NAs
#' @export
extract_code_refinery_course_urls <- function(text) { # nolint
  stringr::str_match(
    text,
    "<a href=\"(.*)\">"
  )[, 2]
}
