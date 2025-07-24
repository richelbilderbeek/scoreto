#' Get the SciLifeLab courses
#' @return a table with all SciLifeLab courses.
#' @export
get_sll_courses <- function() {
  sll_url <- "https://training.scilifelab.se/events"
  lines <- readr::read_lines(sll_url)

  course_names_with_nas <- stringr::str_match(lines, "name\": \"(.*)\",")[, 2]
  course_names <- course_names_with_nas[!is.na(course_names_with_nas)]

  urls_with_nas <- stringr::str_match(lines, "url\": \"(.*)\",")[, 2]
  urls <- urls_with_nas[!is.na(urls_with_nas)]

  dates_with_nas <- stringr::str_match(lines, "<p>(.* 20..)</p>")[, 2]
  dates <- dates_with_nas[!is.na(dates_with_nas)]
  from_dates <- scoreto::extract_sll_from_date(dates)
  to_dates <- scoreto::extract_sll_to_date(dates)

  testthat::expect_equal(length(course_names), length(urls))
  testthat::expect_equal(length(course_names), length(dates))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = urls,
    provider_courses_url = sll_url,
    provider_name = "SciLifeLab"
  )
}
