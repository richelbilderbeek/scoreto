#' Get all the courses, as a Markdown table
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/courses/}.
#' @param t a table, as returned by \link{get_courses}
#' or \link{get_test_courses_table}, passing the requirements
#' of \link{is_correctly_formatted_courses_table}
#' @return a Markdown table  of all courses, as text
#' @seealso use \link{get_courses} to get this
#' table as a table.
#' @export
get_courses_as_markdown <- function(t = get_courses()) {
  testthat::expect_true(is_correctly_formatted_courses_table(t))

  # Convert URLs to Markdown strings, add a warning if link is broken
  testthat::expect_true("course_url" %in% names(t))
  course_url <- t$course_url
  invalid_link_indices <- which(!are_valid_links(course_url))
  course_url <- paste0("[Course site](", course_url, ")")
  course_url[invalid_link_indices] <- paste0(
    ":warning: ", course_url[invalid_link_indices]
  )
  t$course_url <- course_url

  # Convert URLs to Markdown strings, add a warning if link is broken
  testthat::expect_true("provider_courses_url" %in% names(t))
  provider_courses_url <- t$provider_courses_url
  invalid_link_indices <- which(!are_valid_links(provider_courses_url))
  provider_courses_url <- paste0(
    "[Provider site](",
    provider_courses_url,
    ")"
  )
  provider_courses_url[invalid_link_indices] <- paste0(
    ":warning: ", provider_courses_url[invalid_link_indices]
  )
  t$provider_courses_url <- provider_courses_url

  # Add logo and link
  t$provider_name <- paste0(
    "![",
    t$provider_name,
    " logo](",
    get_logo_paths(t$provider_name),
    ")"
  )

  text <- knitr::kable(t)
  names(t)
  text[1] <- paste0(
    "|**From**|**To**|**Course name**|**Course site**",
    "|**Provider site**|**Provider name**|"
  )
  text[2] <- get_optimal_markdown_divider(text)
  text
}
