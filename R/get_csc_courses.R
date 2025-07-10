#' Get the CSC courses
#' @return a table with all CSC courses.
#' @export
get_csc_courses <- function() {
  csc_training_url <- "https://lumi-supercomputer.eu/events/"
  all_lines <- readr::read_lines(csc_training_url)

  from_index <- stringr::str_which(
    all_lines,
    "<a href=\"https://lumi-supercomputer.eu/events/\">&nbsp;Events and Training</a>" # nolint
  ) + 1
  testthat::expect_equal(1, length(from_index))

  to_index <- stringr::str_which(
    all_lines,
    "<a href=\"/past-events\">See past events</a>"
  ) - 1
  testthat::expect_equal(1, length(to_index))

  lines <- all_lines[from_index:to_index]

  from_dates <- extract_csc_from_dates(lines)
  to_dates <- extract_csc_to_dates(lines)
  course_names <- extract_csc_course_names(lines)
  course_urls <- extract_csc_course_urls(lines)

  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(course_names))
  testthat::expect_equal(length(from_dates), length(course_urls))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = csc_training_url,
    provider_name = "CSC"
  )
}
