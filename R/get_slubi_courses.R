#' Get the SLUBI courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_slubi_html} or \link{get_test_slubi_html}
#' @return a table with all SLUBI courses, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_slubi_courses <- function(html_text = scoreto::get_slubi_html()) {

  website <- rvest::read_html(paste(html_text, collapse = "\n"))
  body <- website |> rvest::html_element("body")
  container <- body |> rvest::html_element(".quarto-container")
  content <- container |> rvest::html_element(".content")
  course_listing <- content |> rvest::html_element(".quarto-listing")
  courses_list <- course_listing |> rvest::html_element(".list")

  course_names <- courses_list |>
    rvest::html_elements(".listing-title") |>
    rvest::html_text(trim = TRUE)
  english_from_dates <- courses_list |>
    rvest::html_elements(".listing-start") |>
    rvest::html_text(trim = TRUE)
  testthat::expect_equal(length(course_names), length(english_from_dates))
  english_to_dates <- courses_list |>
    rvest::html_elements(".listing-end") |>
    rvest::html_text(trim = TRUE)
  testthat::expect_equal(length(course_names), length(english_to_dates))
  relative_urls <- courses_list |>
    rvest::html_elements(".thumbnail") |>
    rvest::html_node("a") |>
    rvest::html_attr("href")
  testthat::expect_equal(length(course_names), length(relative_urls))

  from_dates <- scoreto::extract_slubi_from_dates(english_from_dates)
  to_dates <- scoreto::extract_slubi_to_dates(english_to_dates)
  course_urls <- scoreto::extract_slubi_course_urls(relative_urls)

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_slubi_courses_url(),
    provider_name = "SLUBI"
  )
}
