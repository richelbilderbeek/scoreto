#' Extract the URL of a course from an InfraViz courses text
#' @param infraviz_courses_text subset of raw HTML from the InfraViz website.
#' @return a collection of strings and NAs
#' @export
extract_infraviz_course_urls <- function(infraviz_courses_text) {
  text_with_urls <- stringr::str_subset(
    infraviz_courses_text,
    "<a href=\".*\" class=\"card-action\">"
  )
  urls <- stringr::str_match(
    text_with_urls,
    "<a href=\"(.*)\" class=\"card-action\">"
  )[, 2]
  urls

}
