test_that("minimal use", {
  expect_silent(get_web_host_as_markdown(t = get_web_host()))
})

test_that("use", {
  t <- get_web_host_as_markdown()
  expect_equal(
    t[1],
    "|Web host name|Deploy type|Data sensitivity|User fee|Accessible for|Center(s)|"
  )

  # Number of pipes is equal is each line
  counts <- stringr::str_count(t, "\\|")
  expect_true(all(counts == counts[1]))
})
