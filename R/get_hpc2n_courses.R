#' Get the HPC2N courses
#' @return a table with all HPC2N courses.
#' @export
get_hpc2n_courses <- function(html_text = scoreto::get_hpc2n_html()) {
  all_lines <- html_text
  from_index <- 2 + stringr::str_which(all_lines, "Upcoming")
  to_index <- stringr::str_which(all_lines, "Previous") - 2

  lines <- all_lines[from_index:to_index]

  from_dates <- scoreto::extract_hpc2n_from_dates(hpc2n_courses_text = lines)
  to_dates <- scoreto::extract_hpc2n_to_dates(lines)
  course_names <- scoreto::extract_hpc2n_course_names(lines)
  course_urls <- scoreto::extract_hpc2n_course_urls(lines)
  course_urls[is.na(course_urls)] <- hpc2n_courses_url

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = hpc2n_courses_url,
    provider_name = "HPC2N"
  )
}
