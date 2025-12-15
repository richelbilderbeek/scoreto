#' Get the OSCU events
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_oscu_html} or \link{get_test_oscu_html}
#' @return a table with all OSCU events, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_oscu_events <- function(html_text = scoreto::get_oscu_html()) {
  when <- NULL # No visible binding for global variable

  website <- rvest::read_html(paste(html_text, collapse = "\n"))
  body <- website |> rvest::html_element("body")
  testthat::expect_true(length(body) > 0)
  main <- body |> rvest::html_element("main")
  testthat::expect_true(length(main) > 0)
  article <- main |> rvest::html_element("article")
  testthat::expect_true(length(article) > 0)
  table <- main |> rvest::html_element("table")
  testthat::expect_true(length(table) > 0)
  t <- table |> rvest::html_table()
  testthat::expect_true(stringr::str_detect(names(t)[1], "When"))
  testthat::expect_true(stringr::str_detect(names(t)[2], "Where"))
  testthat::expect_true(stringr::str_detect(names(t)[3], "What"))
  names(t) <- c("when", "where", "what")

  t_valid <- t |> 
    dplyr::filter(
      stringr::str_detect(when, "^[:digit:]{4}-[:digit:]{2}-[:digit:]{2}")
    )

  t_valid$from_dates <- stringr::str_sub(t_valid$when, 1, 10)
  t_valid$to_dates <- t_valid$from_dates
  t_valid$course_names <- t_valid$what
  t_valid$course_urls <- scoreto::get_oscu_events_url()

  tibble::tibble(
    date_from = t_valid$from_dates,
    date_to = t_valid$to_dates,
    course_name = t_valid$course_names,
    course_url = t_valid$course_urls,
    provider_courses_url = scoreto::get_oscu_events_url(),
    provider_name = "OSCU"
  )
}
