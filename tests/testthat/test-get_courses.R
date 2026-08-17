test_that("use on current online websites", {
  if (beautier::is_on_ci()) {
    t <- get_courses()
    expect_true(is_correctly_formatted_courses_table(t))

    # All dates must be relevant
    expect_true(all(t$date_to >= lubridate::today()))

    # All course URLs must exist
    course_url_is_valid <- RCurl::url.exists(t$course_url)
    invalid_urls <- names(course_url_is_valid[course_url_is_valid == FALSE])
    expect_equal(0, length(invalid_urls))
  }
})
