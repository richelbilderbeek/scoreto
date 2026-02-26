#' Get the Mimer courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_mimer_html} or \link{get_test_mimer_html}
#' @return a table with all Mimer courses, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_mimer_courses <- function(html_text = scoreto::get_mimer_html()) {

  website <- rvest::read_html(paste(html_text, collapse = "\n"))
  body <- website |> rvest::html_element("body")
  testthat::expect_true(length(body) > 0)
  main <- body |> rvest::html_element("main")
  testthat::expect_true(length(main) > 0)

  calendar_list <- body |> rvest::html_element(".tribe-events-pro-photo")
  #calendar_list <- body |> rvest::html_element(".tribe-events-calendar-list")
  testthat::expect_true(length(calendar_list) > 0)

  events <- calendar_list |> rvest::html_elements("article")
  testthat::expect_true(length(events) > 0)


  # Original
  # english_date_ranges <- events |>
  #   rvest::html_elements("time") |>
  #   rvest::html_text(trim = TRUE)

  # english_date_ranges <- events |>
  #   rvest::html_elements("time") |>
  #   rvest::html_attr("datetime") |>
  #   rvest::html_text(trim = TRUE)

  date_ranges <- events |>
    rvest::html_elements(".tribe-events-pro-photo__event-date-tag-datetime") |>
    rvest::html_attr("datetime")
  testthat::expect_true(length(date_ranges) > 0)

  # english_from_dates <- scoreto::extract_english_from_dates(
  #   english_date_ranges = english_date_ranges
  # )
  # english_to_dates <- scoreto::extract_english_to_dates(
  #   english_date_ranges = english_date_ranges
  # )
  # testthat::expect_equal(length(english_from_dates), length(english_to_dates))

  course_names <- events |> rvest::html_node("a") |> rvest::html_text(trim = TRUE)
  # testthat::expect_equal(length(english_from_dates), length(course_names))
  testthat::expect_equal(length(date_ranges), length(course_names))
  testthat::expect_equal(0, sum(is.na(course_names)))


  course_urls <- events |> rvest::html_node("a") |> rvest::html_attr("href")
  # testthat::expect_equal(length(english_from_dates), length(course_urls))
  testthat::expect_equal(length(date_ranges), length(course_urls))

  #from_dates <- scoreto::convert_english_dates_to_iso_8601(english_from_dates)
  from_dates <- date_ranges
  #to_dates <- scoreto::convert_english_dates_to_iso_8601(english_to_dates)
  to_dates <- date_ranges


  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_mimer_courses_url(),
    provider_name = "Mimer"
  )
}
