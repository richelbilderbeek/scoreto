#' Extract the URL of a course from an NSC courses text
#' @param nsc_courses_text subset of raw HTML from the NSC website.
#' @param nsc_home_url The URL for the NSC home
#' @return a collection of strings and NAs
#' @export
extract_nsc_course_urls <- function(
  nsc_courses_text,
  nsc_home_url = scoreto::get_provider_home_url("NSC")
) {
  rel_urls <- stringr::str_match(
    nsc_courses_text,
    "<a href=\"(.*)\">"
  )[, 2]
  paste0(nsc_home_url, rel_urls)
}
