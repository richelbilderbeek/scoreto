test_that("use", {
  skip("CDHU has humans in mind")
  t <- get_cdhu_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})
