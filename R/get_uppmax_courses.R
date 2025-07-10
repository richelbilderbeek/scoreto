#' Get the NAISS courses
#' @return a table with all NAISS courses.
#' @export
get_uppmax_courses <- function() {

  # Cannot use the pretty rendered source at
  # https://docs.uppmax.uu.se/courses_workshops/courses_workshops/
  # because it cannot be read
  uppmax_url <- paste0(
    "https://raw.githubusercontent.com/",
    "UPPMAX/UPPMAX-documentation/refs/heads/main/",
    "docs/courses_workshops/courses_workshops.md"
  )
  all_lines <- readr::read_lines(uppmax_url)

  lines <- stringr::str_subset(all_lines, ".md-button--primary")


  dates <- stringr::str_match(lines, "<br> _(.*)_\\]")[, 2]
  from_dates <- extract_uppmax_from_dates(dates)
  to_dates <- extract_uppmax_to_dates(dates)
  course_names_with_brs <- stringr::str_match(lines, "\\[(.*) <br>")[, 2]
  course_names <- stringr::str_replace_all(course_names_with_brs, "<br> ", "")
  relative_urls <- stringr::str_match(lines, "\\((.*)\\)")[, 2]
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

  provider_courses_url <- paste0(
    "https://docs.uppmax.uu.se/",
    "courses_workshops/courses_workshops/"
  )

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = urls,
    provider_courses_url = provider_courses_url,
    provider_name = "UPPMAX"
  )
}
