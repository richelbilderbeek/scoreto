#' Get the SciLifeLab courses
#' @return
#'   a table with all SciLifeLab courses.
#'
#'   This table is a \link[tibble]{tibble} with these column names:
#'   - `source`: the URL where this course was found
#'   - `name`: the name of the course
#'   - `url`: the URL of the course
#' @export
get_sll_courses <- function() {
  sll_url <- "https://training.scilifelab.se/events"
  lines <- readr::read_lines(sll_url)

    course_names_with_nas <- stringr::str_match(lines, "name\": \"(.*)\",")[, 2]
  course_names <- course_names_with_nas[!is.na(course_names_with_nas)]

  urls_with_nas <- stringr::str_match(lines, "url\": \"(.*)\",")[, 2]
  urls <- urls_with_nas[!is.na(urls_with_nas)]

  testthat::expect_equal(length(course_names), length(urls))

  tibble::tibble(
    source = sll_url,
    name = course_names,
    url = urls
  )
}
