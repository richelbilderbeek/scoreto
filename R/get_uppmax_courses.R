#' Get the NAISS courses
#' @return a table with all UPPMAX courses, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_uppmax_courses <- function(html_text = scoreto::get_uppmax_html()) {

  all_lines <- html_text

  all_button_lines <- stringr::str_subset(all_lines, ".md-button--primary")
  lines <- stringr::str_subset(
    all_button_lines,
    "NAISS training page",
    negate = TRUE
  )

  dates <- stringr::str_match(lines, "(<br> _|<em>)(.*)(</em>|_)\\]")[, 3]
  testthat::expect_equal(0, sum(is.na(dates)))

  from_dates <- scoreto::convert_english_dates_to_iso_8601(
    scoreto::extract_english_from_dates(dates)
  )
  testthat::expect_equal(0, sum(is.na(from_dates)))

  to_dates <- scoreto::convert_english_dates_to_iso_8601(
    scoreto::extract_english_to_dates(dates)
  )
  testthat::expect_equal(0, sum(is.na(to_dates)))

  course_names_with_brs <- stringr::str_match(lines, "(\\\">|\\[)(.*) <br>")[, 3]
  testthat::expect_equal(0, sum(is.na(course_names_with_brs)))

  course_names <- stringr::str_replace_all(course_names_with_brs, "<br> ", "")
  testthat::expect_equal(0, sum(is.na(course_names)))

  relative_urls <- stringr::str_match(lines, "(href=\\\"|_\\]\\()(.*.md)(/\\\">|\\))")[, 3]
  testthat::expect_equal(0, sum(is.na(relative_urls)))

  urls <- relative_urls
  index_with_relative_urls <- stringr::str_which(urls, pattern = "\\md$")
  urls[index_with_relative_urls] <-
    paste0(
      "https://docs.uppmax.uu.se/courses_workshops/",
      urls[index_with_relative_urls]
    )
  urls[index_with_relative_urls] <- tools::file_path_sans_ext(
    urls[index_with_relative_urls]
  )

  testthat::expect_equal(length(course_names), length(urls))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = urls,
    provider_courses_url = scoreto::get_provider_courses_url("UPPMAX"),
    provider_name = "UPPMAX"
  )
}
