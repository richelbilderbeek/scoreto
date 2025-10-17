#' Get the InfraViz courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_infraviz_html} or \link{get_test_infraviz_html}
#' @return a table with all InfraViz courses, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_infraviz_courses <- function(html_text = scoreto::get_infraviz_html()) {
  from_index <- stringr::str_which(
    html_text,
    "<strong>More News</strong>"
  ) + 1
  testthat::expect_equal(1, length(from_index))

  to_index <- stringr::str_which(
    html_text,
    "<strong>Past Events</strong>"
  ) - 5
  testthat::expect_equal(1, length(to_index))


  lines <- html_text[from_index:to_index]
  lines

  workshop_title_indices <- stringr::str_which(
    lines,
    "<h2 class=\"wp-block-post-title\"><a href=\"https://infravis.se/workshop"
  )
  title_lines <- lines[workshop_title_indices]
  excerpt_lines <- lines[workshop_title_indices + 2]

  from_dates <- scoreto::extract_infraviz_from_dates(infraviz_courses_text = excerpt_lines)  # nolint
  to_dates <- scoreto::extract_infraviz_to_dates(
    infraviz_courses_text = excerpt_lines
  )
  course_names <- scoreto::extract_infraviz_course_names(infraviz_courses_text = title_lines) # nolint
  course_urls <- scoreto::extract_infraviz_course_urls(infraviz_courses_text = title_lines) # nolint

  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(course_names))
  testthat::expect_equal(length(from_dates), length(course_urls))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_infraviz_courses_url(),
    provider_name = "InfraViz"
  )
}
