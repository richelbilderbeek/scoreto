#' Get the Code Refinery courses
#' @return a table with all Code Refinery courses.
#' @export
get_code_refinery_courses <- function() {
  code_refinery_training_url <- "https://coderefinery.org/workshops/upcoming/"
  all_lines <- readr::read_lines(code_refinery_training_url)

  from_index <- stringr::str_which(
    all_lines,
    "<h2 id=\"upcoming-coderefinery-workshops\">Upcoming CodeRefinery workshops</h2>" # nolint
  ) + 1

  to_index <- stringr::str_which(
    all_lines,
    "<h2 id=\"recent-workshops-and-events\">Recent workshops and events</h2>"
  ) - 1

  section_lines <- all_lines[from_index:to_index]
  lines <- stringr::str_subset(section_lines, "<li>.*</li>")

  from_dates <- extract_code_refinery_from_dates(lines)
  to_dates <- extract_code_refinery_to_dates(lines)
  course_names <- extract_code_refinery_course_names(lines)
  course_urls <- extract_code_refinery_course_urls(lines)

  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(course_names))
  testthat::expect_equal(length(from_dates), length(course_urls))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = code_refinery_training_url,
    provider_name = "Code Refinery"
  )
}
