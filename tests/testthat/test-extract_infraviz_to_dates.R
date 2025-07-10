test_that("use", {
  infraviz_courses_text <- "<div class=\"wp-block-post-excerpt has-small-font-size\"><p class=\"wp-block-post-excerpt__excerpt\">Time: April 3, 2025; Location: Uppsala University </p></div></div></div>"
  to_dates <- extract_infraviz_to_dates(infraviz_courses_text)
  expect_equal(length(infraviz_courses_text), length(to_dates))
})
