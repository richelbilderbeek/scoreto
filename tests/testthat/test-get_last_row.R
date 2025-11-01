test_that("use", {
  t <- stringr::str_match_all(
    "Mar 02nd & Mar 03rd, 2020",
    "([:digit:]{1,2})([:lower:])"
  )[[1]]
  expect_equal(
    t[2, ],
    get_last_row(t)
  )
})
