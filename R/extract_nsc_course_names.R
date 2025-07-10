#' Extract the course names from an NSC courses text
#' @param nsc_courses_text subset of raw HTML from the NSC website.
#' @export
extract_nsc_course_names <- function(nsc_courses_text) {

  nsc_course_names <- stringr::str_match(
    nsc_courses_text,
    "<a href.*>(.*)</a>"
  )[, 2]
  testthat::expect_equal(0, sum(is.na(nsc_course_names)))
  nsc_course_names
}
