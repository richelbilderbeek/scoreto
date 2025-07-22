test_that("use", {
  expect_silent(get_compute_as_markdown(t = get_compute()))

  t <- get_compute_as_markdown()
  expect_equal(
    t[1],
    "HPC cluster name|Type of computation|Type of data|User fee|Accessible for|Center(s)"
  )
})
