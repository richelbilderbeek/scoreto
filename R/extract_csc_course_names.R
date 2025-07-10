#' Extract the course names from an CSC courses text
#' @param csc_courses_text subset of raw HTML from the CSC website.
#' @export
extract_csc_course_names <- function(csc_courses_text) {

  text_with_titles <- stringr::str_subset(
    csc_courses_text,
    "<h2 class=\"event-title\">.*</h2>"
  )
  titles <- stringr::str_match(
    text_with_titles,
    "<h2 class=\"event-title\">(.*)</h2>"
  )[, 2]
  titles
}
