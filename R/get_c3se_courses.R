#' Get the C3SE courses
#' @param html_text HTML text to parse, as can be obtained by
#' \link{get_c3se_html}
#' @return a table with all C3SE courses.
#' @export
get_c3se_courses <- function(html_text = scoreto::get_c3se_html()) {
  all_lines <- html_text

  from_index <- 1 + stringr::str_which(
    all_lines,
    "<h2.*News and upcoming events"
  )
  testthat::expect_equal(1, length(from_index))
  to_index <- stringr::str_which(
    all_lines,
    "<h2.*Acknowledgement suggestion"
  ) - 1
  testthat::expect_equal(1, length(to_index))

  table_lines <- all_lines[from_index:to_index]
  from_index <- 1 + which(table_lines == "<tbody>")
  to_index <- which(table_lines == "</tbody>") - 1
  lines <- table_lines[from_index:to_index]

  dates_with_na <- stringr::str_match(
    lines,
    "<td>(<nobr>)?([[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2})(</nobr>)?</td>"
  )[, 3]

  # No courses
  if (all(is.na(dates_with_na))) {
    return(scoreto::create_empty_courses_table())
  }

  testthat::expect_false(all(is.na(dates_with_na)))
  dates <- as.character(stats::na.omit(dates_with_na))

  course_descriptions_with_nas <- stringr::str_match(
    lines,
    "^<td>(<p>)?([:upper:].*)(</p>)?</td>"
  )[, 3]
  testthat::expect_false(all(is.na(course_descriptions_with_nas)))
  course_descriptions <- as.character(
    stats::na.omit(course_descriptions_with_nas)
  )
  course_description_sentences <- stringr::str_split(
    course_descriptions,
    "\\. "
  )
  course_names_with_strong <- sapply(course_description_sentences, "[[", 1)
  course_names <- stringr::str_replace_all(
    course_names_with_strong,
    "</?strong>",
    ""
  )
  testthat::expect_equal(length(dates), length(course_names))

  urls <- stringr::str_match(
    course_descriptions,
    "<a href=\"(.*)\">.*</a>"
  )[, 2]
  testthat::expect_equal(length(dates), length(urls))

  dates <- dates[!is.na(urls)]
  course_names <- course_names[!is.na(urls)]

  if (length(dates) == 0) {
    return(scoreto::create_empty_courses_table())
  }

  tibble::tibble(
    date_from = dates,
    date_to = dates,
    course_name = course_names,
    course_url = urls,
    provider_courses_url = scoreto::get_provider_courses_url("C3SE"),
    provider_name = "C3SE"
  )
}
