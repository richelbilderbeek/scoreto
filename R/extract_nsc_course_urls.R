#' Extract the URL of a course from an NSC courses text
#' @param nsc_courses_text subset of raw HTML from the NSC website.
#' @param nsc_training_url The URL for the NSC courses
#' @return a collection of strings and NAs
#' @export
extract_nsc_course_urls <- function(
  nsc_courses_text,
  nsc_training_url = "https://www.nsc.liu.se/support/Events/"
) {
  rel_urls <- stringr::str_match(
    nsc_courses_text,
    "<a href=\"(.*)\">"
  )[, 2]
  paste0(nsc_training_url, rel_urls)
}
