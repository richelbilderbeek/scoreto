#' Get the NAISS courses
#' @inheritParams default_params_doc
#' @return a table with all NAISS courses, where
#' the table will pass the test of
#' \link{is_correctly_formatted_courses_table}
#' @export
get_naiss_courses <- function(
  html_text = scoreto::get_provider_courses_url("NAISS")
) {

  website <- rvest::read_html(paste(html_text, collapse = "\n"))
  table <- website |> rvest::html_element("table")
  testthat::expect_true(length(table) > 0)

  t <- table |> rvest::html_table()
  testthat::expect_true(
    all(names(t) == c("Date", "Course", "Location", "Info"))
  )
  names(t) <- c("date_range", "course_name", "course_type", "course_info")

  course_names <- t$course_name
  english_date_ranges <- t$date_range
  testthat::expect_equal(length(course_names), length(english_date_ranges))

  row_texts <- as.character(
    table |> rvest::html_element("tbody") |> rvest::html_elements("tr")
  )
  course_rel_urls <- stringr::str_match(row_texts, "a href=\"([^\"]+)")[, 2]
  testthat::expect_equal(length(course_names), length(course_rel_urls))

  course_urls <- scoreto::parse_urls(
    base_url = scoreto::get_provider_courses_url("NAISS"),
    relative_urls = course_rel_urls
  )
  testthat::expect_equal(length(course_names), length(course_urls))

  na_indices <- which(is.na(course_urls))
  course_urls[na_indices] <- scoreto::get_provider_courses_url("NAISS")
  testthat::expect_equal(0, sum(is.na(course_urls)))

  from_dates <- scoreto::convert_english_dates_to_iso_8601(
    scoreto::extract_english_from_dates(english_date_ranges)
  )
  testthat::expect_true(scoreto::are_correctly_formatted_dates(from_dates))

  to_dates <- scoreto::convert_english_dates_to_iso_8601(
    scoreto::extract_english_to_dates(english_date_ranges)
  )
  testthat::expect_true(scoreto::are_correctly_formatted_dates(to_dates))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = scoreto::get_provider_courses_url("NAISS"),
    provider_name = "NAISS"
  )
}
