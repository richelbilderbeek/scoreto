#' Extract the URL of a course from an LUNARC courses text
#' @param lunarc_courses_text subset of raw HTML from the LUNARC website.
#' @return a collection of strings and NAs
#' @export
extract_lunarc_course_urls <- function(
  lunarc_courses_text,
  lunarc_courses_url = "https://www.lunarc.lu.se/learning-more/training-courses"
) {
  rel_urls <- stringr::str_match(
    lunarc_courses_text,
    "<a href=\"(.*)\">"
  )[, 2]
  paste0(lunarc_courses_url, rel_urls)
}
