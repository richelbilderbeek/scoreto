#' Get the OSCU events
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_oscu_html} or \link{get_test_oscu_html}
#' @return a table with all OSCU events, where
#' the table will pass the test of
#' \link{is_correctly_formatted_events_table}
#' @export
get_oscu_events <- function(html_text = scoreto::get_oscu_html()) {

  website <- rvest::read_html(paste(html_text, collapse = "\n"))
  body <- website |> rvest::html_element("body")
  testthat::expect_true(length(body) > 0)
  main <- body |> rvest::html_element("main")
  testthat::expect_true(length(main) > 0)
  article <- main |> rvest::html_element("article")
  testthat::expect_true(length(article) > 0)
  HIERO
  article <- main |> rvest::html_element(".md-typeset___table")
  testthat::expect_true(length(article) > 0)

  article |> rvest::html_table()

  # All content
  #content <- container |> rvest::html_element(".entry-content")
  #content <- container |> rvest::html_element(".md-typeset_table")
  #testthat::expect_true(length(content) > 0)

  website |> rvest::html_table()
  stringr::str_subset(html_text, "[:digit:]{4}-[:digit:]{2}-[:digit:]{2}")

  from_dates <- scoreto::extract_oscu_from_dates(oscu_events_text = lines)
  to_dates <- scoreto::extract_oscu_to_dates(lines)
  course_names <- scoreto::extract_oscu_course_names(lines)
  course_urls <- scoreto::extract_oscu_course_urls(lines)
  course_urls[is.na(course_urls)] <- scoreto::get_oscu_events_url()

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_events_url = scoreto::get_oscu_events_url(),
    provider_name = "OSCU"
  )
}
