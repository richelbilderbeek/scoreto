#' Get the LUNARC courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_lunarc_html} or \link{get_test_lunarc_html}
#' @return a table with all LUNARC courses.
#' @export
get_lunarc_courses <- function(html_text = get_lunarc_html()) {

  full_line <- stringr::str_subset(
    html_text,
    "The following events are currently scheduled"
  )
  line <- stringr::str_match(full_line, "<ul>(.*)</ul>")[, 2]
  lines_as_list <- stringr::str_split(line, pattern = "</li><li>")
  lines <- sapply(lines_as_list, "[[", 1)

  from_dates <- scoreto::extract_lunarc_from_dates(lines)
  to_dates <- scoreto::extract_lunarc_to_dates(lines)
  course_names <- scoreto::extract_lunarc_course_names(lines)
  course_urls <- scoreto::extract_lunarc_course_urls(
    lunarc_courses_text = lines
  )

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = get_lunarc_courses_url(),
    provider_name = "LUNARC"
  )
}
