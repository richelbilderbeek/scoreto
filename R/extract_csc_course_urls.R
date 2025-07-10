#' Extract the URL of a course from an CSC courses text
#' @param csc_courses_text subset of raw HTML from the CSC website.
#' @return a collection of strings and NAs
#' @export
extract_csc_course_urls <- function(csc_courses_text) {
  text_with_urls <- stringr::str_subset(
    csc_courses_text,
    "<a href=\".*\" class=\"card-action\">"
  )
  urls <- stringr::str_match(
    text_with_urls,
    "<a href=\"(.*)\" class=\"card-action\">"
  )[, 2]
  urls

}
