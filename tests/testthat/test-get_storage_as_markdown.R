test_that("minimal use", {
  expect_silent(get_storage_as_markdown(t = get_storage()))
})

test_that("use", {
  t <- get_storage_as_markdown()

  # Remove Markdown linter texts
  t <- t[c(-1, -2, -(length(t) - 1), -length(t))]

  expect_equal(
    t[1],
    paste0(
      "|HPC storage system name|Data sensitivity|Data activity|",
      "User fee|Accessible for|Center(s)|"
    )

  )

  # Number of pipes is equal is each line
  counts <- stringr::str_count(t, "\\|")
  expect_true(all(counts == counts[1]))
})
