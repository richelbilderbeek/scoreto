test_that("use, from href", {
  expect_equal(
    extract_rel_url(text = "<p><a class=\"md-button md-button--primary\" href=\"../uppmax_intro_course/\">Introduction to Linux and UPPMAX <br> <em>August 24-26 2026</em></a></p>"),
    "../uppmax_intro_course"
  )
})

test_that("use, from Markdown link", {
  expect_equal(
    extract_rel_url(text = "[Introduction to Linux and UPPMAX <br> _August 24-26 2026_](uppmax_intro_course.md){ .md-button .md-button--primary }"),
    "uppmax_intro_course.md"
  )
})

test_that("absolute URLs are NAs", {
  expect_true(
    is.na(
      extract_rel_url(
        text = "<p><a class=\"md-button md-button--primary\" href=\"https://uppmax.github.io/bianca_workshops/beginner/intro/\">Introduction to Bianca: Handling Sensitive Research Data <br> <em>September 18 2026</em></a></p>"
      )
    )
  )
})


