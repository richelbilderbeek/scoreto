#' Get the SciLifeLab courses
#' @return
#'   a table with all SciLifeLab courses.
#'
#'   This table is a \link[tibble]{tibble} with column names `name`
#'   and `url`.
#' @export
get_sll_courses <- function() {
  lines <- readr::read_lines("https://training.scilifelab.se/events")

    course_names_with_nas <- stringr::str_match(lines, "name\": \"(.*)\",")[, 2]
  course_names <- course_names_with_nas[!is.na(course_names_with_nas)]

  urls_with_nas <- stringr::str_match(lines, "url\": \"(.*)\",")[, 2]
  urls <- urls_with_nas[!is.na(urls_with_nas)]

  testthat::expect_equal(length(course_names), length(urls))

  tibble::tibble(
    name = course_names,
    url = urls
  )
}
