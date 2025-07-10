#' Extract the course names from an Code Refinery courses text
#' @param code_refinery_courses_text subset of raw HTML from the Code Refinery website.
#' @export
extract_code_refinery_course_names <- function(code_refinery_courses_text) {

  code_refinery_course_names_in_urls <- stringr::str_match(
    code_refinery_courses_text,
    "<a href.*>(.*)</a>"
  )[, 2]
  code_refinery_course_names_without_urls <- stringr::str_match(
    code_refinery_courses_text,
    "<li>(.*), [:digit:]"
  )[, 2]
  code_refinery_course_names <- code_refinery_course_names_in_urls
  na_indices <- which(is.na(code_refinery_course_names))
  code_refinery_course_names[na_indices] <- code_refinery_course_names_without_urls[na_indices]
  testthat::expect_equal(0, sum(is.na(code_refinery_course_names)))
  code_refinery_course_names
}
