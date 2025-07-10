#' Extract the URL of a course from an InfraViz courses text
#' @param infraviz_courses_text subset of raw HTML from the InfraViz website.
#' @return a collection of strings and NAs
#' @export
extract_infraviz_course_urls <- function(infraviz_courses_text) {
  stringr::str_match(
    infraviz_courses_text,
    "<a href=\"(.*)\" target"
  )[, 2]
}
