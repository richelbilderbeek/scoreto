#' Extract the course names from an PDC courses text
#' @param pdc_courses_text subset of raw HTML from the PDC website.
#' @export
extract_pdc_course_names <- function(pdc_courses_text) {

  pdc_course_names <- stringr::str_match(
    pdc_courses_text,
    "href.*>(.*)</a>"
  )[, 2]
  testthat::expect_equal(0, sum(is.na(pdc_course_names)))
  pdc_course_names
}
