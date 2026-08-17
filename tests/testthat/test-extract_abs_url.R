test_that("use", {
  expect_equal(
    extract_abs_url("[Introduction to Bianca: Handling Sensitive Research Data <br> _September 18 2026_](https://uppmax.github.io/bianca_workshops/beginner/intro/){ .md-button .md-button--primary }"),
    "https://uppmax.github.io/bianca_workshops/beginner/intro"
  )
})
