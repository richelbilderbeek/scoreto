#' Get the InfraViz courses
#' @return a table with all InfraViz courses.
#' @export
get_infraviz_courses <- function() {
  infraviz_training_url <- "https://infravis.se/news-events/"
  all_lines <- readr::read_lines(infraviz_training_url)


  from_index <- stringr::str_which(
    all_lines,
    "<strong>More News</strong>"
  ) + 1
  testthat::expect_equal(1, length(from_index))

  to_index <- stringr::str_which(
    all_lines,
    "<strong>Past Events</strong>"
  ) - 5
  testthat::expect_equal(1, length(to_index))


  lines <- all_lines[from_index:to_index]
  lines

  workshop_title_indices <- stringr::str_which(lines, "<h2 class=\"wp-block-post-title\"><a href=\"https://infravis.se/workshop")
  title_lines <- lines[workshop_title_indices]
  excerpt_lines <- lines[workshop_title_indices + 2]

  from_dates <- extract_infraviz_from_dates(infraviz_courses_text = excerpt_lines)
  to_dates <- extract_infraviz_to_dates(infraviz_courses_text = excerpt_lines)
  course_names <- extract_infraviz_course_names(infraviz_courses_text = title_lines)
  course_urls <- extract_infraviz_course_urls(infraviz_courses_text = title_lines)

  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(course_names))
  testthat::expect_equal(length(from_dates), length(course_urls))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = infraviz_training_url,
    provider_name = "InfraViz"
  )
}
