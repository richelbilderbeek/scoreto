#' Get all the courses, as a Markdown table
#'
#' @return a Markdown table  of all courses, as text
#' @export
get_courses_as_markdown <- function() {
  t <- get_courses()

  # Convert URLs to Markdown strings
  testthat::expect_true("course_url" %in% names(t))
  t$course_url <- paste0("[Course site](", t$course_url, ")")

  # Convert URLs to Markdown strings
  testthat::expect_true("provider_courses_url" %in% names(t))
  t$provider_courses_url <- paste0("[Provider site](", t$provider_courses_url, ")")

  text <- knitr::kable(t)
  names(t)
  text[1] <- "|**From**|**To**|**Course name**|**Course site**|**Provider site**|**Provider name**|"
  text[2] <- "|:----------|:----------|:---------------------------------------------------|:-----------|:------------|:------------|"
  text
}
