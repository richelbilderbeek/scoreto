#' Extract the URL of a course from an LUNARC courses text
#' @param lunarc_courses_text subset of raw HTML from the LUNARC website.
#' @param lunarc_home_url The URL for the LUNARC home
#' @return a collection of strings and NAs
#' @export
extract_lunarc_course_urls <- function(
  lunarc_courses_text,
  lunarc_home_url = scoreto::get_provider_home_url("LUNARC")
) {
  rel_urls <- stringr::str_match(
    lunarc_courses_text,
    "<a href=\"(.*)\">"
  )[, 2]
  paste0(lunarc_home_url, rel_urls)
}
