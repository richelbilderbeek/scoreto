#' Get the PDC courses
#' @param html_text HTML text of the PDC courses page
#' (as obtained with \link{get_pdc_html})
#' @return a table with all PDC courses.
#' @export
get_pdc_courses <- function(html_text = scoreto::get_pdc_html()) {
  all_lines <- html_text

  event_indices <- stringr::str_which(
    all_lines,
    "<li class=\"calendar__event\">"
  )
  if (length(event_indices) == 0) {
    empty_tibble <- scoreto::create_test_courses_table()[c(), ]
    return(empty_tibble)
  }
  titles <- all_lines[event_indices + 3]
  dates <- all_lines[event_indices + 6]


  from_dates <- scoreto::extract_pdc_from_dates(pdc_courses_text = dates)
  to_dates <- scoreto::extract_pdc_to_dates(pdc_courses_text = dates)
  course_names <- scoreto::extract_pdc_course_names(pdc_courses_text = titles)
  course_urls <- scoreto::extract_pdc_course_urls(pdc_courses_text = titles)

  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(course_names))
  testthat::expect_equal(length(from_dates), length(course_urls))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_provider_courses_url("PDC"),
    provider_name = "PDC"
  )
}
