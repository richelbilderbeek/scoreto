test_that("minimal use", {
  expect_silent(get_other_as_markdown(t = get_other()))
})

test_that("use", {
  t <- get_other_as_markdown()
  expect_equal(
    t[1],
    "|Name|Description|User fee|Accessible for|Center(s)|"
  )

  # Number of pipes is equal is each line
  counts <- stringr::str_count(t, "\\|")
  expect_true(all(counts == counts[1]))
})
