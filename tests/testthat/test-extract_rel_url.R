test_that("use", {
  expect_equal(
    extract_rel_url(text = "<p><a class=\"md-button md-button--primary\" href=\"../uppmax_intro_course/\">Introduction to Linux and UPPMAX <br> <em>August 24-26 2026</em></a></p>"),
    "../uppmax_intro_course"
  )
})
