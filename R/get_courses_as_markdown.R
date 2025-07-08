#' Get all the courses, as a Markdown table
#'
#' @return a Markdown table  of all courses, as text
#' @export
get_courses_as_markdown <- function() {
  t <- get_courses()

  # Convert URLs to Markdown strings
  t$url <- paste0("[Course site](", t$url, ")")

  # Convert URLs to Markdown strings
  t$source <- paste0("[Provider site](", t$source, ")")

  text <- knitr::kable(t)
  #message(text)
  #max(nchar(t$name))
  testthat::expect_match(text[1], "|date_from[:blank:]*|date_to[:blank:]*|name[:blank:]*|url[:blank:]*|source[:blank:]*|")
  text[1] <- "|**From**|**To**|**Course name**|**Course site**|**Provider site**|"
  testthat::expect_match(text[2], "|:-+|:-+|:-+|:-+|:-+|")
  #           | 2025-01-01| 2025-01-01|Long course name                                    |Course site |Provider site
  text[2] <- "|:----------|:----------|:---------------------------------------------------|:-----------|:------------|"
  text
}
