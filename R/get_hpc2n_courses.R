#' Get the HPC2N courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_hpc2n_html} or \link{get_test_hpc2n_html}
#' @return a table with all HPC2N courses, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_hpc2n_courses <- function(html_text = scoreto::get_hpc2n_html()) {
  all_lines <- html_text
  from_index <- 2 + stringr::str_which(all_lines, "Upcoming")
  to_index <- stringr::str_which(all_lines, "Previous") - 2

  lines <- all_lines[from_index:to_index]

  english_date_ranges <- extract_english_ranges(lines)
  english_from_dates <- scoreto::extract_english_from_dates(english_date_ranges)
  english_to_dates <- scoreto::extract_english_to_dates(english_date_ranges)
  from_dates <- scoreto::convert_english_dates_to_iso_8601(english_from_dates)
  to_dates <- scoreto::convert_english_dates_to_iso_8601(english_to_dates)

  course_names <- scoreto::extract_hpc2n_course_names(lines)
  course_urls <- scoreto::extract_hpc2n_course_urls(lines)
  course_urls[is.na(course_urls)] <- scoreto::get_hpc2n_courses_url()

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_hpc2n_courses_url(),
    provider_name = "HPC2N"
  )
}
