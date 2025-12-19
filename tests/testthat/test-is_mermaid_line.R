test_that("use", {
  text <- readr::read_lines(get_scoreto_path("compute_1.md"))
  expect_equal(length(text), length(is_mermaid_line(text)))
  expect_true(sum(is_mermaid_line(text)) > 0)
})
