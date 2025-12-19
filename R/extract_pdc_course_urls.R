#' Extract the URL of a course from an PDC courses text
#' @param pdc_courses_text subset of raw HTML from the PDC website.
#' @param pdc_training_url The URL for the PDC courses
#' @return a collection of strings and NAs
#' @export
extract_pdc_course_urls <- function(
  pdc_courses_text,
  pdc_training_url = scoreto::get_provider_home_url("PDC") # No idea why this needs to be the homepage # nolint
) {
  rel_url <- stringr::str_match(
    pdc_courses_text,
    "href=\"(.*)\">.*</a>"
  )[, 2]
  testthat::expect_equal(0, sum(is.na(rel_url)))
  paste0(pdc_training_url, "/", rel_url)

}
