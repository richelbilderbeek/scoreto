#' Get the SLUBI courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_slubi_html} or \link{get_test_slubi_html}
#' @return a table with all SLUBI courses, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_slubi_courses <- function(html_text = scoreto::get_slubi_html()) {
  all_lines <- html_text
  from_index <- 2 + stringr::str_which(all_lines, "<h1 class=\"title\">Courses</h1>")
  to_index <- stringr::str_which(all_lines, "</main> <!-- /main -->") - 2

  lines <- all_lines[from_index:to_index]

  from_dates <- scoreto::extract_slubi_from_dates(slubi_courses_text = lines)
  to_dates <- scoreto::extract_slubi_to_dates(lines)
  course_names <- scoreto::extract_slubi_course_names(lines)
  course_urls <- scoreto::extract_slubi_course_urls(lines)
  course_urls[is.na(course_urls)] <- scoreto::get_slubi_courses_url()

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_slubi_courses_url(),
    provider_name = "SLUBI"
  )
}
