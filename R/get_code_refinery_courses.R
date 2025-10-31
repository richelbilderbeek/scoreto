#' Get the Code Refinery courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_code_refinery_html} or \link{get_test_code_refinery_html}
#' @return a table with all Code Refinery courses.
#' @export
get_code_refinery_courses <- function(html_text = scoreto::get_code_refinery_html()) {

  all_lines <- html_text

  from_index <- stringr::str_which(
    all_lines,
    "<h2 id=\"upcoming-coderefinery-workshops\">Upcoming CodeRefinery workshops</h2>" # nolint
  ) + 1
  testthat::expect_equal(1, length(from_index))

  to_index <- stringr::str_which(
    all_lines,
    "<h2 id=\"recent-workshops-and-events\">Recent workshops and events</h2>"
  ) - 1
  testthat::expect_equal(1, length(to_index))

  section_lines <- all_lines[from_index:to_index]
  lines <- stringr::str_subset(section_lines, "<li>.*</li>")

  if (length(lines) == 0) {
    empty_tibble <- scoreto::create_test_courses_table()[c(), ]
    return(empty_tibble)
  }

  from_dates <- scoreto::extract_code_refinery_from_dates(lines)
  to_dates <- scoreto::extract_code_refinery_to_dates(lines)
  course_names <- scoreto::extract_code_refinery_course_names(lines)
  course_urls <- scoreto::extract_code_refinery_course_urls(lines)

  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(course_names))
  testthat::expect_equal(length(from_dates), length(course_urls))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_code_refinery_courses_url(),
    provider_name = "Code Refinery"
  )
}
