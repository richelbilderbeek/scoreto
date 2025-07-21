test_that("use", {
  expect_equal(
    are_valid_links(
      c(
        "https://nbisweden.github.io/SCoRe_user_doc",
        "https://nbisweden.github.io/SCoRe_user_doc/nonsense_url"
      )
    ),
    c(TRUE, FALSE)
  )
})
