#' Get the CSC courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_csc_html} or \link{get_test_csc_html}
#' @return a table with all CSC courses.
#' @export
get_csc_courses <- function(html_text = scoreto::get_csc_html()) {

  # CSC maintains this page by hand, without checking for correct HTML
  testthat::expect_equal(2, sum(stringr::str_detect(html_text, "</html>")))
  testthat::expect_equal(2, sum(stringr::str_detect(html_text, "</head>")))

  # Fix the human errors for the 'html' tage
  which_close_html_indices <- stringr::str_which(html_text, "</html>")
  # It is the first '</html>' that needs to be removed
  testthat::expect_equal("</html>", html_text[which_close_html_indices[1]])
  html_text[which_close_html_indices[1]] <- ""

  # Fix the human errors for the 'head' tage
  which_close_head_indices <- stringr::str_which(html_text, "</head>")
  # It is the first '</head>' that needs to be removed
  testthat::expect_equal("\t</head>", html_text[which_close_head_indices[1]])
  html_text[which_close_head_indices[1]] <- ""

  # Done fixing
  testthat::expect_equal(1, sum(stringr::str_detect(html_text, "</html>")))
  testthat::expect_equal(1, sum(stringr::str_detect(html_text, "</head>")))


  website <- rvest::read_html(paste(html_text, collapse = "\n"))

  body <- website |> rvest::html_element("body")
  testthat::expect_true(length(body) > 0)

  main <-  body |> rvest::html_element("main")
  testthat::expect_true(length(main) > 0)
  container <- main |> rvest::html_element(".container")
  testthat::expect_true(length(container) > 0)

  content <- container |> rvest::html_element(".content-wrapper")
  testthat::expect_true(length(content) > 0)

  # Cannot use event types, because an event can have multiple types
  # event_types <- content |> rvest::html_elements(".event-badge") |> rvest::html_text(trim = TRUE) # nolint

  csc_date_ranges <- content |> rvest::html_elements(".event-date") |> rvest::html_text(trim = TRUE)
  course_names <- content |> rvest::html_elements(".card-action") |> rvest::html_text(trim = TRUE)
  course_urls <- content |> rvest::html_elements(".card-action") |> rvest::html_attr("href")
  testthat::expect_equal(length(csc_date_ranges), length(course_names))
  testthat::expect_equal(length(csc_date_ranges), length(course_urls))

  # Not all events have dates
  empty_date_indices <- which(csc_date_ranges == "")
  csc_date_ranges <- csc_date_ranges[-empty_date_indices]
  course_names <- course_names[-empty_date_indices]
  course_urls <- course_urls[-empty_date_indices]
  testthat::expect_equal(length(csc_date_ranges), length(course_names))
  testthat::expect_equal(length(csc_date_ranges), length(course_urls))

  from_dates <- scoreto::extract_csc_from_dates(csc_date_ranges = csc_date_ranges)
  to_dates <- scoreto::extract_csc_to_dates(csc_date_ranges = csc_date_ranges)

  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(course_names))
  testthat::expect_equal(length(from_dates), length(course_urls))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_csc_courses_url(),
    provider_name = "CSC"
  )
}
