test_that("use on testing data 1", {
  t <- get_infraviz_course_info(
    course_page_url = "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_1.html" # nolint
  )
  expect_true("date_from" %in% names(t))
  expect_true("date_to" %in% names(t))
  expect_false(stringr::str_detect(t$date_from, "NA"))
  expect_false(stringr::str_detect(t$date_to, "NA"))
  expect_true(is_correctly_formatted_date(t$date_from))
  expect_true(is_correctly_formatted_date(t$date_to))
})

test_that("use on testing data 2", {
  t <- get_infraviz_course_info(
    course_page_url = "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_2.html" # nolint
  )
  expect_true("date_from" %in% names(t))
  expect_true("date_to" %in% names(t))
  expect_false(stringr::str_detect(t$date_from, "NA"))
  expect_false(stringr::str_detect(t$date_to, "NA"))
  expect_true(is_correctly_formatted_date(t$date_from))
  expect_true(is_correctly_formatted_date(t$date_to))
})

test_that("use on testing data 3", {
  t <- get_infraviz_course_info(
    course_page_url = "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_3.html" # nolint
  )
  expect_true("date_from" %in% names(t))
  expect_true("date_to" %in% names(t))
  expect_false(stringr::str_detect(t$date_from, "NA"))
  expect_false(stringr::str_detect(t$date_to, "NA"))
  expect_true(is_correctly_formatted_date(t$date_from))
  expect_true(is_correctly_formatted_date(t$date_to))
})

test_that("use on testing data 4", {
  t <- get_infraviz_course_info(
    course_page_url = "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_4.html" # nolint
  )
  expect_true("date_from" %in% names(t))
  expect_true("date_to" %in% names(t))
  expect_false(stringr::str_detect(t$date_from, "NA"))
  expect_false(stringr::str_detect(t$date_to, "NA"))
  expect_true(is_correctly_formatted_date(t$date_from))
  expect_true(is_correctly_formatted_date(t$date_to))
})


test_that("use on testing data 5", {
  course_page_url <- "https://infravis.se/workshop-nodegoat/"
  course_page_url <- "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_5.html" # nolint
  t <- get_infraviz_course_info(
    course_page_url = course_page_url
  )
  expect_true("date_from" %in% names(t))
  expect_true("date_to" %in% names(t))
  expect_false(stringr::str_detect(t$date_from, "NA"))
  expect_false(stringr::str_detect(t$date_to, "NA"))
  expect_true(is_correctly_formatted_date(t$date_from))
  expect_true(is_correctly_formatted_date(t$date_to))
})
