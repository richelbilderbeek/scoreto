#' Get the LUNARC courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_lunarc_html} or \link{get_test_lunarc_html}
#' @return a table with all LUNARC courses.
#' @export
get_lunarc_courses <- function(html_text = scoreto::get_lunarc_html()) {

  course_titles_line_indices <- stringr::str_which(
    html_text,
    "<i class=\"fal fa-chevron-circle-right\""
  )
  if (length(course_titles_line_indices) == 0) {
    empty_tibble <- scoreto::create_test_courses_table()[c(), ]
    return(empty_tibble)
  }
  course_title_lines <- html_text[course_titles_line_indices]
  course_titles_with_dates <- stringr::str_match(
    course_title_lines,
    " title=\"(.*)\">"
  )[, 2]
  course_names <- stringr::str_match(
    course_titles_with_dates,
    "(.*)(, | in)"
  )[, 2]
  course_dates <- stringr::str_match(
    course_titles_with_dates,
    ".*(, | in )(.*)"
  )[, 3]

  english_from_dates <- scoreto::extract_english_from_dates(course_dates)
  from_dates <- scoreto::convert_english_dates_to_iso_8601(english_from_dates)
  english_to_dates <- scoreto::extract_english_to_dates(course_dates)
  to_dates <- scoreto::convert_english_dates_to_iso_8601(english_to_dates)
  course_urls <- scoreto::get_lunarc_courses_url()

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_lunarc_courses_url(),
    provider_name = "LUNARC"
  )
}
