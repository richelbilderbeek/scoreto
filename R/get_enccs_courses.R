#' Get the ENCCS courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_enccs_html} or \link{get_test_enccs_html}
#' @return a table with all ENCCS courses.
#' @export
get_enccs_courses <- function(html_text = scoreto::get_enccs_html()) {

  all_lines <- html_text
  last_useless_line_index <- stringr::str_which(all_lines, "<body ")
  lines <- all_lines[-(1:last_useless_line_index)]

  date_indices <- stringr::str_which(lines, "tribe-event-date-start")
  from_dates_with_nas <- stringr::str_match(
    lines[date_indices],
    paste0(
      "<span class=\"tribe-event-date-start\">",
      "(.*) . [:digit:]{2}\\:[:digit:]{2}",
      "</span> - "
    )
  )[, 2]
  from_dates_enccs <- as.character(stats::na.omit(from_dates_with_nas))
  from_dates <- scoreto::convert_enccs_dates(from_dates_enccs)
  testthat::expect_equal(length(date_indices), length(from_dates))


  # NA if the event is one day
  to_dates_with_nas <- stringr::str_match(
    lines[date_indices],
    paste0(
      "<span class=\"tribe-event-date-end\">",
      "(.*) . [:digit:]{2}\\:[:digit:]{2}",
      "</span>"
    )
  )[, 2]
  na_indices <- which(is.na(to_dates_with_nas))
  to_dates_enccs <- to_dates_with_nas
  to_dates_enccs[na_indices] <- from_dates_enccs[na_indices]
  to_dates <- scoreto::convert_enccs_dates(to_dates_enccs)
  testthat::expect_equal(length(date_indices), length(from_dates))



  title_lines <- lines[date_indices + 5]
  course_names_with_unicode <- stringr::str_match(title_lines, "\"(.*)\"")[, 2]
  course_names <- stringr::str_replace(
    course_names_with_unicode,
    "&#8211;",
    "-"
  )

  url_lines <- lines[date_indices + 4]
  urls <- stringr::str_match(url_lines, "\"(.*)\"")[, 2]

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = urls,
    provider_courses_url = scoreto::get_enccs_courses_url(),
    provider_name = "ENCCS"
  )
}
