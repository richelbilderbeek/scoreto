#' Extract the course info from an InfraViz page
#' @param course_page_url URL to the course page
#' @return a \link[tibble]{tibble}
#' with column names `date_from` and `date_to`
#' @export
get_infraviz_course_info <- function(course_page_url) {
  website <- rvest::read_html(course_page_url)
  testthat::expect_true(length(website) > 0)

  body <- website |> rvest::html_element("body")
  testthat::expect_true(length(body) > 0)
  main <- body |> rvest::html_element("main")
  testthat::expect_true(length(main) > 0)

  article <- main |> rvest::html_element("article")
  testthat::expect_true(length(article) > 0)

  column_text <- article |> rvest::html_element(".wp-block-columns") |> rvest::html_text(trim = TRUE)

  english_date_range <- stringr::str_match(
    column_text,
    "Date:[:blank:]?([:digit:]+[:blank:][:upper:][:lower:]+[:blank:][:digit:]{4})" # nolint
  )[, 2]

  english_date_from <- scoreto::extract_english_from_date(
    english_date_range = english_date_range
  )
  english_date_to <- scoreto::extract_english_to_date(
    english_date_range = english_date_range
  )
  date_from <- scoreto::convert_english_date_to_iso_8601(
    english_date = english_date_from
  )
  date_to <- scoreto::convert_english_date_to_iso_8601(
    english_date = english_date_to
  )
  t <- tibble::tibble(
    date_from = date_from,
    date_to = date_to
  )
  testthat::expect_true("date_from" %in% names(t))
  testthat::expect_true("date_to" %in% names(t))
  testthat::expect_true(scoreto::is_correctly_formatted_date(t$date_from))
  testthat::expect_true(scoreto::is_correctly_formatted_date(t$date_to))
  t
}
