#' Extract the course names from an InfraViz courses text
#' @param infraviz_courses_text subset of raw HTML from the InfraViz website.
#' @export
extract_infraviz_course_names <- function(infraviz_courses_text) {

  stringr::str_match(
    infraviz_courses_text,
    "self\" >(.*)</a></h2>"
  )[2]
}
