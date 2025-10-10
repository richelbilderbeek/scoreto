#' Create a test courses table
#' @export
create_test_courses_table <- function() {
  tibble::tibble(
    date_from = "1234-05-06",
    date_to = "2345-06-07",
    course_name = "test_course",
    course_url = "https://course.com",
    provider_courses_url = "https://course.com",
    provider_name = "test_provider_name"
  )
}
