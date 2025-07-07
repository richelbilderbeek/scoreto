#' Get all the courses, as a Markdown table
#'
#' @return a Markdown table  of all courses, as text
#' @export
get_courses_as_markdown <- function() {
  t <- get_courses()
  knitr::kable(t)
}
