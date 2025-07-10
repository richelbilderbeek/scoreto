#' Extract the course names from an InfraViz courses text
#' @param infraviz_courses_text subset of raw HTML from the InfraViz website.
#' @export
extract_infraviz_course_names <- function(infraviz_courses_text) {

  text_with_titles <- stringr::str_subset(
    infraviz_courses_text,
    "<h2 class=\"event-title\">.*</h2>"
  )
  titles <- stringr::str_match(
    text_with_titles,
    "<h2 class=\"event-title\">(.*)</h2>"
  )[, 2]
  titles
}
