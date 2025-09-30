#' Extract the URL of a course from an SLUBI courses text
#' @param slubi_courses_text subset of raw HTML from the SLUBI website.
#' @return a collection of strings and NAs
#' @export
extract_slubi_course_urls <- function(slubi_courses_text) {
  course_urls_html <- stringr::str_match(
    slubi_courses_text,
    "^<a href=\"./(.*)\" class=\"no-external\">(.*)</a>$"
  )[, 2]
  course_urls <- course_urls_html[!is.na(course_urls_html)]
  paste0("https://www.slubi.se/", course_urls)
}
