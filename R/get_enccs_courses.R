#' Get the ENCCS courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_enccs_html} or \link{get_test_enccs_html}
#' @return a table with all ENCCS courses.
#' @export
get_enccs_courses <- function(html_text = scoreto::get_enccs_html()) {

  website <- rvest::read_html(paste(html_text, collapse = "\n"))
  testthat::expect_true(length(website) > 0)
  body <- website |> rvest::html_element("body")
  testthat::expect_true(length(body) > 0)
  site <- body |> rvest::html_element(".site")
  testthat::expect_true(length(site) > 0)

  events <- site |> rvest::html_element(".tribe-events-calendar-list")
  testthat::expect_true(length(events) > 0)

  title_links <- events |> rvest::html_elements(".tribe-events-calendar-list__event-title-link")
  testthat::expect_true(length(title_links) > 0)

  course_urls <- title_links |> rvest::html_attr("href")
  course_names <- title_links |> rvest::html_text(trim = TRUE)
  testthat::expect_equal(length(course_urls), length(course_urls))

  from_dates <- events |> rvest::html_elements(".tribe-events-calendar-list__event-datetime") |> rvest::html_attr("datetime")
  testthat::expect_equal(length(course_urls), length(from_dates))
  to_dates <- from_dates
  testthat::expect_equal(length(course_urls), length(to_dates))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_provider_courses_url("ENCCS"),
    provider_name = "ENCCS"
  )
}
