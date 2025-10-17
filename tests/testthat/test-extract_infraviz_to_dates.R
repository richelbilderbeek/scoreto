test_that("use 1", {
  infraviz_courses_text <- "<div class=\"wp-block-post-excerpt has-small-font-size\"><p class=\"wp-block-post-excerpt__excerpt\">Time: April 3, 2025; Location: Uppsala University </p></div></div></div>" # nolint
  to_dates <- extract_infraviz_to_dates(infraviz_courses_text)
  expect_equal(length(infraviz_courses_text), length(to_dates))
})

test_that("use 2", {
  infraviz_courses_text <- "<div class=\"wp-block-post-excerpt has-small-font-size\"><p class=\"wp-block-post-excerpt__excerpt\">Welcome to a hands-on GIS workshop at Uppsala University 6 November 13.15-15. The workshop is held by InfraVis application expert Vasiliki Tsoumari. </p></div></div></div>" # nolint
  to_dates <- extract_infraviz_to_dates(infraviz_courses_text)
  expect_equal(length(infraviz_courses_text), length(to_dates))
})
