#' Extract the URL of a course from an Code Refinery courses text
#' @param code_refinery_courses_text subset of raw HTML from the Code Refinery website.
#' @return a collection of strings and NAs
#' @export
extract_code_refinery_course_urls <- function(code_refinery_courses_text) {
  stringr::str_match(
    code_refinery_courses_text,
    "<a href=\"(.*)\">"
  )[, 2]
}
