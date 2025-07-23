test_that("simple example", {
  text <- knitr::kable(
    tibble::tribble(
      ~a, ~b,
      "123", "1234"
    )
  )
  expect_equal(get_optimal_markdown_divider(text), "|:---|:----|")
})

test_that("name is longer", {
  text <- knitr::kable(
    tibble::tribble(
      ~abcdef, ~b,
      "123", "1234"
    )
  )
  expect_equal(get_optimal_markdown_divider(text), "|:------|:----|")
})

test_that("images are shortened to 3 dashes", {
  text <- knitr::kable(
    tibble::tribble(
      ~a, ~b,
      "123", "![image caption](image_path.png)"
    )
  )
  expect_equal(get_optimal_markdown_divider(text), "|:---|:---|")
})

test_that("links are shortened to their description", {
  text <- knitr::kable(
    tibble::tribble(
      ~a, ~b,
      "123", "[123456](some_path.md)"
    )
  )
  expect_equal(get_optimal_markdown_divider(text), "|:---|:------|")
})
