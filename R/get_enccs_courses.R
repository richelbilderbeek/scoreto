#' Get the ENCCS courses
#' @return a table with all ENCCS courses.
#' @export
get_enccs_courses <- function() {

  # Cannot use the pretty rendered source at
  # https://docs.enccs.uu.se/courses_workshops/courses_workshops/
  # because it cannot be read
  enccs_url <- "https://enccs.se/events"
  all_lines <- readr::read_lines(enccs_url)


  last_useless_line_index <- stringr::str_which(all_lines, "<body ")
  lines <- all_lines[ -(1:last_useless_line_index) ]

  date_indices <- stringr::str_which(lines, "tribe-event-date-start")
  from_dates_with_nas <- stringr::str_match(lines[date_indices], "<span class=\"tribe-event-date-start\">([:upper:][:lower:]{2} [:digit:]{1,2}) .*</span>")[,2]
  from_dates <- as.character(na.omit(from_dates_with_nas))
  testthat::expect_equal(length(date_indices), length(from_dates))

  to_date_indices <- date_indices
  # NA if the event is one day
  to_dates_with_nas <- stringr::str_match(lines[date_indices], "<span class=\"tribe-event-date-end\">([:upper:][:lower:]{2} [:digit:]{1,2}) .*</span>")[,2]
  na_indices <- which(is.na(to_dates_with_nas))
  to_dates <- to_dates_with_nas
  to_dates[na_indices] <- from_dates[na_indices]
  testthat::expect_equal(length(date_indices), length(to_dates))

  title_lines <- lines[date_indices + 5]
  course_names_with_unicode <- stringr::str_match(title_lines, "\"(.*)\"")[, 2]
  course_names <- stringr::str_replace(course_names_with_unicode, "&#8211;", "-")

  url_lines <- lines[date_indices + 4]
  urls <- stringr::str_match(url_lines, "\"(.*)\"")[, 2]

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    name = course_names,
    url = urls,
    source = enccs_url
  )
}
