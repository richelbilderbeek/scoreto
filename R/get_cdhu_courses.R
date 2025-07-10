#' Get the CDHU courses
#'
#' @note
#' The text that CDHU provides is too complex to parse.
#' If the text is written for humans, then let humans decipher it.
#' Until the text at CDHU is made machine-readable
#' in any reasonable way, the courses of CDHU will not be shown
#' @return a table with all CDHU courses.
#' @export
get_cdhu_courses <- function() {
  cdhu_training_url <- "https://www.uu.se/en/centre/digital-humanities-and-social-sciences/training-opportunities/courses" # nolint
  all_lines <- readr::read_lines(cdhu_training_url)

  from_index <- 1 + stringr::str_which(all_lines, "CoursesofferedbytheCDHU")
  to_index <- stringr::str_which(all_lines, "Previouscourseinformation")[1] - 1
  lines_with_folded_content <- all_lines[from_index:to_index]
  lines <- stringr::str_subset(
    lines_with_folded_content,
    "<div class=\"sv-text-portlet sv-use-margins toggle-section-subheading3 env-collapse sv-clearfix\" id" # nolint
  )
  testthat::expect_true(length(lines) > 1)

  stop(
    "The text that CDHU provides is too complex to parse. ",
    "If the text is written for humans, then let humans decipher it. ",
    "Until the text at CDHU is made machine-readable ",
    "in any reasonable way, the courses of CDHU will not be shown"
  )

  tibble::tibble(
    date_from = NA,
    date_to = NA,
    course_name = NA,
    course_url = NA,
    provider_courses_url = cdhu_training_url,
    provider_name = "CDHU"
  )
}
