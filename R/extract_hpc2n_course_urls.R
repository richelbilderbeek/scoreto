#' Extract the URL of a course from an HPC2N courses text
#' @param hpc2n_courses_text subset of raw HTML from the HPC2N website.
#' @return a collection of strings and NAs
#' @export
extract_hpc2n_course_urls <- function(hpc2n_courses_text) {
  stringr::str_match(
    hpc2n_courses_text,
    "<a href=\"(.*)\">"
  )[, 2]
}
