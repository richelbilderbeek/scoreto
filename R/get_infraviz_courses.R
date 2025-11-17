#' Get the InfraViz courses.
#'
#' This function searches for the titles and URLs
#' of workshops. Unlike other course providers, the course
#' dates are not shown at this overview, but can only be found
#' in the specific pages of the workshop.
#' The function \link{get_infraviz_course_info}
#' extracts the information from a workshop page.
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_infraviz_html} or \link{get_test_infraviz_html}
#' @return a table with all InfraViz courses, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_infraviz_courses <- function(html_text = scoreto::get_infraviz_html()) {

  date_from <- NULL # No visible binding for global variable
  date_to <- NULL # No visible binding for global variable
  course_name <- NULL # No visible binding for global variable
  course_url <- NULL # No visible binding for global variable
  provider_courses_url <- NULL # No visible binding for global variable
  provider_name <- NULL # No visible binding for global variable

  website <- rvest::read_html(paste(html_text, collapse = "\n"))
  body <- website |> rvest::html_element("body")
  testthat::expect_true(length(body) > 0)
  container <- body |> rvest::html_element(".content-container")
  testthat::expect_true(length(container) > 0)


  # All content
  content <- container |> rvest::html_element(".entry-content")
  testthat::expect_true(length(content) > 0)


  # All content part of 'More news'. Remove highlights and past events
  if ("use_spelling" == "old") {
    news_content <- content |> rvest::html_nodes(xpath = '//*[@id="news"]')
  } else {
    news_content <- content |> rvest::html_nodes("#news")
  }
  testthat::expect_true(length(news_content) > 0)

  posts <- news_content |> rvest::html_elements(".wp-block-post")
  testthat::expect_true(length(posts) > 0)

  post_titles <- posts |> rvest::html_element(".wp-block-post-title")
  testthat::expect_true(length(post_titles) > 0)

  titles <- post_titles |> rvest::html_text()
  urls <- post_titles |> rvest::html_node("a") |> rvest::html_attr("href")
  testthat::expect_equal(length(titles), length(urls))

  all_news <- tibble::tibble(
    course_name = titles,
    course_url = urls
  )
  workshops <- all_news |>
    dplyr::filter(stringr::str_detect(course_name, "[wW]orkshop"))

  workshop_dates <- scoreto::get_infraviz_courses_infos(
    course_pages_urls = workshops$course_url
  )
  workshop_dates$course_url <- workshops$course_url
  testthat::expect_true("course_name" %in% names(workshops))
  testthat::expect_true("course_url" %in% names(workshops))
  testthat::expect_true("course_url" %in% names(workshop_dates))
  testthat::expect_true("date_from" %in% names(workshop_dates))
  testthat::expect_true("date_to" %in% names(workshop_dates))
  t <- tibble::as_tibble(merge(workshops, workshop_dates, by = "course_url"))
  testthat::expect_true("course_name" %in% names(t))
  testthat::expect_true("course_url" %in% names(t))
  testthat::expect_true("course_url" %in% names(t))
  testthat::expect_true("date_from" %in% names(t))
  testthat::expect_true("date_to" %in% names(t))
  t$provider_courses_url <- scoreto::get_infraviz_courses_url()
  t$provider_name <- "InfraViz"

  # Reorder
  t <- t |> dplyr::select(
    date_from,
    date_to,
    course_name,
    course_url,
    provider_courses_url,
    provider_name
    )
  testthat::expect_true(scoreto::is_correctly_formatted_courses_table(t))
  t
}
