#' Extract the course names from an HPC2N courses text
#' @param lunarc_courses_text subset of raw HTML from the HPC2N website.
#' @export
extract_lunarc_course_names <- function(lunarc_courses_text) {

  lunarc_course_names <- stringr::str_match(
    lunarc_courses_text,
    "<a href.*>(.*[:alpha:]), [:digit:].*</a>"
  )[, 2]

  testthat::expect_equal(0, sum(is.na(lunarc_course_names)))
  lunarc_course_names
}
