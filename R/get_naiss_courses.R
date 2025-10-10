#' Get the NAISS courses
#' @return a table with all NAISS courses, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_naiss_courses <- function() {
  naiss_url <- "https://www.naiss.se/events/"
  lines <- readr::read_lines(naiss_url)
  testthat::expect_true(length(lines) > 0)
  dates <- NA

  course_names <- NA

  urls <- NA

  testthat::expect_equal(length(course_names), length(urls))

  t <- tibble::tibble(
    date_from = dates,
    date_to = dates,
    course_name = course_names,
    course_url = urls,
    provider_courses_url = naiss_url,
    provider_name = "NAISS"
  )
  t$date_from <- as.character(t$date_from)
  t$date_to <- as.character(t$date_to)
  t$course_name <- as.character(t$course_name)
  t$course_url <- as.character(t$course_url)
  t$provider_courses_url <- as.character(t$provider_courses_url)
  t$provider_courses_url <- as.character(t$provider_courses_url)

  t[-1, ]
}
