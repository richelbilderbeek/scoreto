#' Get a table of courses, to be used in testing.
#'
#' Get a table of courses, to be used in testing,
#' similar to the one returned by (the much slower) \link{get_courses}
#' @return a table of all courses, to be used in testing.
#' The second row contains a course that has an invalied `course_url`.
#' @export
get_test_courses_table <- function() {

  t <- tibble::tribble(
    ~date_from, ~date_to, ~course_name, ~course_url, ~provider_courses_url, ~provider_name, # nolint indeed a long line
    "2024-03-14", "2024-03-14", "Course in something", "https://docs.uppmax.uu.se/courses_workshops/intro_to_python/", "https://docs.uppmax.uu.se/courses_workshops/courses_workshops/", "UPPMAX", # nolint indeed a long line
    "2025-03-14", "2025-03-14", "Course with failing course URL", "https://docs.uppmax.uu.se/failing_url", "https://docs.uppmax.uu.se/courses_workshops/courses_workshops/", "UPPMAX", # nolint indeed a long line
  )

  testthat::expect_true(is_correctly_formatted_courses_table(t))
  t
}
