test_that("use", {
  expect_output(get_storage_as_markdown(t = get_storage()))

  t <- get_storage_as_markdown()
  expect_equal(
    t[1],
    "|HPC storage system name|Data sensivity|Data activity|User fee|Accessible for|Center(s)|"
  )

  # Number of pipes is equal is each line
  counts <- stringr::str_count(t, "\\|")
  expect_true(all(counts == counts[1]))
})
