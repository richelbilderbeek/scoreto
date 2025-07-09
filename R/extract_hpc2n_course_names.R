#' Extract the course names from an HPC2N courses text
#' @param hpc2n_courses_text subset of raw HTML from the HPC2N website.
#' @export
extract_hpc2n_course_names <- function(hpc2n_courses_text) {

  hpc2n_course_names_in_urls <- stringr::str_match(
    hpc2n_courses_text,
    "<a href.*>(.*)</a>"
  )[, 2]
  hpc2n_course_names_without_urls <- stringr::str_match(
    hpc2n_courses_text,
    "<li>(.*), [:digit:]"
  )[, 2]
  hpc2n_course_names <- hpc2n_course_names_in_urls
  na_indices <- which(is.na(hpc2n_course_names))
  hpc2n_course_names[na_indices] <- hpc2n_course_names_without_urls[na_indices]
  testthat::expect_equal(0, sum(is.na(hpc2n_course_names)))
  hpc2n_course_names
}
