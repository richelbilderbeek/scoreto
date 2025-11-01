#' Get the SciLifeLab courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_sll_html} or \link{get_test_sll_html}
#' @return a table with all SciLifeLab courses.
#' @export
get_sll_courses <- function(html_text = scoreto::get_sll_html()) {

  website <- rvest::read_html(paste(html_text, collapse = "\n"))
  body <- website |> rvest::html_element("body")
  wrapper <- body |> rvest::html_element(".wrapper")
  content <- wrapper |> rvest::html_element(".tab-content")
  course_items <- content |>
    rvest::html_element(".tab-pane") |>
    rvest::html_element(".masonry")

  course_titles <- course_items |>
    rvest::html_elements(".right-container") |>
    rvest::html_element("h4") |>
    rvest::html_text(trim = TRUE)
  english_date_ranges <- course_items |>
    rvest::html_elements(".right-container") |>
    rvest::html_element("p") |>
    rvest::html_text(trim = TRUE)
  testthat::expect_equal(length(course_titles), length(english_date_ranges))

  rel_urls_with_nas <- course_items |>
    rvest::html_elements(".with-left-icon") |>
    rvest::html_attr("href")
  # Half of the entries is NA for some reason ...?
  rel_urls <- rel_urls_with_nas[!is.na(rel_urls_with_nas)]
  testthat::expect_equal(length(course_titles), length(rel_urls))

  from_dates <- scoreto::convert_english_dates_to_iso_8601(
    scoreto::extract_english_from_dates(
      english_date_ranges
    )
  )
  to_dates <- scoreto::convert_english_dates_to_iso_8601(
    scoreto::extract_english_to_dates(
      english_date_ranges
    )
  )

  urls <- stringr::str_replace_all(
    paste0(scoreto::get_sll_courses_url(), rel_urls),
    "events/events/",
    "events/"
  )


  testthat::expect_equal(length(course_titles), length(from_dates))
  testthat::expect_equal(length(course_titles), length(urls))
  testthat::expect_equal(length(course_titles), length(to_dates))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_titles,
    course_url = urls,
    provider_courses_url = scoreto::get_sll_courses_url(),
    provider_name = "SciLifeLab"
  )
}
