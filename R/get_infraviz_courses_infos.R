#' Extract the course info from an InfraViz page
#' @param course_pages_urls one or more URLs to the course page(s)
#' @return a \link[tibble]{tibble}
#' with column names `date_from` and `date_to`
#' @seealso use \link{get_infraviz_course_info} for one course page URL
#' @export
get_infraviz_courses_infos <- function(course_pages_urls) {
  list_of_tables <- list()
  for (i in seq_along(course_pages_urls)) {
    course_page_url <- course_pages_urls[i]
    t <- scoreto::get_infraviz_course_info(
      course_page_url = course_page_url
    )
    testthat::expect_true("date_to" %in% names(t))
    testthat::expect_true("date_from" %in% names(t))
    list_of_tables[[i]] <- t
  }
  testthat::expect_equal(length(list_of_tables), length(course_pages_urls))
  t <- dplyr::bind_rows(list_of_tables)
  testthat::expect_true("date_to" %in% names(t))
  testthat::expect_true("date_from" %in% names(t))
  testthat::expect_equal(nrow(t), length(course_pages_urls))
  t
}
