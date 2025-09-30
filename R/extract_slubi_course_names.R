#' Extract the course names from an SLUBI courses text
#' @param slubi_courses_text subset of raw HTML from the SLUBI website.
#' @export
extract_slubi_course_names <- function(slubi_courses_text) {

  course_names_html <- stringr::str_match(
    slubi_courses_text,
    "^<a href=\"(.*)\" class=\"no-external\">(.*)</a>$"
  )[, 3]
  course_names_html[!is.na(course_names_html)]
}
