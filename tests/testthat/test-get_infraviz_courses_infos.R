test_that("use on testing data", {
  course_pages_urls <- c(
    "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_1.html", # nolint
    "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_2.html", # nolint
    "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_3.html", # nolint
    "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_4.html", # nolint
    "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_5.html", # nolint
    "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_6.html", # nolint
    "https://raw.githubusercontent.com/richelbilderbeek/scoreto/refs/heads/main/inst/extdata/infraviz_course_7.html" # nolint
  )
  t <- get_infraviz_courses_infos(course_pages_urls = course_pages_urls)

  expect_true("date_from" %in% names(t))
  expect_true("date_to" %in% names(t))
  expect_true(all(stringr::str_detect(t$date_from, "NA") == FALSE))
  expect_true(all(stringr::str_detect(t$date_to, "NA") == FALSE))
  expect_true(are_correctly_formatted_dates(t$date_from))
  expect_true(are_correctly_formatted_dates(t$date_to))
})
