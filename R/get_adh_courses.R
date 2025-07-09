#' Get the AIDA Data Hub courses
#' @return
#'   a table with all AIDA Data Hub courses.
#'
#'   This table is a \link[tibble]{tibble} with these column names:
#'   - `source`: the URL where this course was found
#'   - `name`: the name of the course
#'   - `url`: the URL of the course
#' @export
get_adh_courses <- function() {
  adh_home_url <- "https://datahub.aida.scilifelab.se"
  adh_training_url <- paste0(adh_home_url, "/training/")
  all_lines <- readr::read_lines(adh_training_url)
  lines <- stringr::str_subset(all_lines, "<li style=")

  dates <- stringr::str_match(
    lines,
    "date=\"([[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}) "
  )[, 2]

  course_names <- stringr::str_match(
    lines,
    "<strong><a href=\"/training-events/.*.html\">(.*)</a></strong>"
  )[, 2]

  relative_urls <- stringr::str_match(
    lines,
    "<strong><a href=\"/(training-events/.*.html)\">.*</a></strong>"
  )[, 2]
  urls <- paste0(adh_home_url, "/", relative_urls)
  testthat::expect_equal(length(course_names), length(urls))

  tibble::tibble(
    date_from = dates,
    date_to = dates,
    course_name = course_names,
    course_url = urls,
    provider_courses_url = adh_training_url,
    provider_name = "AIDA Data Hub"
  )
}
