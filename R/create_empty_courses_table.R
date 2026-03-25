#' Create an empty courses table
#' @export
create_empty_courses_table <- function() {
  scoreto::create_test_courses_table()[c(), ]
}
