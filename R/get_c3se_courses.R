#' Get the C3SE courses
#' @return a table with all C3SE courses.
#' @export
get_c3se_courses <- function() {
  c3se_training_url <- "https://www.c3se.chalmers.se/"
  all_lines <- readr::read_lines(c3se_training_url)

  from_index <- 1 + stringr::str_which(all_lines, "<h2.*Current and upcoming events")
  to_index <- stringr::str_which(all_lines, "<h2.*Acknowledgement suggestion") - 1

  table_lines <- all_lines[from_index:to_index]
  from_index <- 1 + which(table_lines == "<tbody>")
  to_index <- which(table_lines == "</tbody>") - 1
  lines <- table_lines[from_index:to_index]

  dates_with_na <- stringr::str_match(
    lines,
    "<td><nobr>([[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2})</nobr></td>"
  )[, 2]
  dates <- as.character(stats::na.omit(dates_with_na))

  course_descriptions_with_nas <- stringr::str_match(
    lines,
    "^<td>([:upper:].*)</td>"
  )[, 2]
  course_descriptions <- as.character(stats::na.omit(course_descriptions_with_nas))
  course_description_sentences <- stringr::str_split(course_descriptions, "\\. ")
  course_names_with_strong <- sapply(course_description_sentences, "[[", 1)
  course_names <- stringr::str_replace_all(course_names_with_strong, "</?strong>", "")
  testthat::expect_equal(length(dates), length(course_names))

  urls <- stringr::str_match(course_descriptions, "<a href=\"(.*)\">.*</a>")[, 2]
  testthat::expect_equal(length(dates), length(urls))

  tibble::tibble(
    date_from = dates,
    date_to = dates,
    course_name = course_names,
    course_url = urls,
    provider_courses_url = c3se_training_url,
    provider_name = "C3SE"
  )
}
