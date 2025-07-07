#' Get the NAISS courses
#' @return
#'   a table with all NAISS courses.
#'
#'   This table is a \link[tibble]{tibble} with these column names:
#'   - `source`: the URL where this course was found
#'   - `name`: the name of the course
#'   - `url`: the URL of the course
#' @export
get_naiss_courses <- function() {
  naiss_url <- "https://www.naiss.se/events/"
  lines <- readr::read_lines(naiss_url)

  dates <- NA

  course_names <- NA

  urls <- NA

  testthat::expect_equal(length(course_names), length(urls))

  tibble::tibble(
    date_from = dates,
    date_to = dates,
    name = course_names,
    url = urls,
    source = naiss_url
  )
}
