#' Get all the courses, as a Markdown table
#'
#' @param t a table, as returned by \link{get_courses}
#' or \link{get_test_courses_table}, passing the requirements
#' of \link{is_correctly_formatted_table}
#' @return a Markdown table  of all courses, as text
#' @export
get_courses_as_markdown <- function(t = get_courses()) {
  testthat::expect_true(is_correctly_formatted_table(t))

  # Convert URLs to Markdown strings
  testthat::expect_true("course_url" %in% names(t))
  course_url <- t$course_url
  invalid_link_indices <- which(!are_valid_links(t$course_url))
  course_url <- paste0("[Course site](", course_url, ")")
  t$course_url <- course_url

  # Convert URLs to Markdown strings
  testthat::expect_true("provider_courses_url" %in% names(t))
  t$provider_courses_url <- paste0(
    "[Provider site](",
    t$provider_courses_url,
    ")"
  )

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
  text[2] <- paste0("|:-----------|:------------",
    "|:---------------------------------------------------",
    "|:-----------|:------------------|:------------|"
  )
  text
}
