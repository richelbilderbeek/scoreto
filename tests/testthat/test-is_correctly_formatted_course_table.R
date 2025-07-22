test_that("us", {

  # Correct
  t <- get_test_courses_table()
  expect_true(is_correctly_formatted_courses_table(t))

  expect_false(is_correctly_formatted_courses_table("nonensse"))
  expect_false(is_correctly_formatted_courses_table(tibble::tibble()))

  # Incorrect number of names
  t <- tibble::tibble(
    date_from = "2025-01-01"
  )
  expect_false(is_correctly_formatted_courses_table(t))

  # Incorrect names
  t <- tibble::tibble(
    wrong_date_from = "2025-01-01",
    date_to = "2025-01-01",
    course_name = "Some course title",
    course_url = "https://someplace.org/schedule",
    provider_courses_url = "https://someplace.org",
    provider_name = "Some provider"
  )
  expect_false(is_correctly_formatted_courses_table(t))

  # Incorrect date format
  t <- tibble::tibble(
    wrong_date_from = "March 14",
    date_to = "March 14",
    course_name = "Some course title",
    course_url = "https://someplace.org/schedule",
    provider_courses_url = "https://someplace.org",
    provider_name = "Some provider"
  )
  expect_false(is_correctly_formatted_courses_table(t))

  # date_from is NA
  t <- get_test_courses_table()
  t$date_from <- NA
  expect_false(is_correctly_formatted_courses_table(t))

  # date_from is nonsense
  t <- get_test_courses_table()
  t$date_from <- "nonsense"
  expect_false(is_correctly_formatted_courses_table(t))

  # date_to is NA
  t <- get_test_courses_table()
  t$date_to <- NA
  expect_false(is_correctly_formatted_courses_table(t))

  # date_to is nonsense
  t <- get_test_courses_table()
  t$date_to <- "nonsense"
  expect_false(is_correctly_formatted_courses_table(t))

  # course_url is NA
  t <- get_test_courses_table()
  t$course_url <- NA
  expect_false(is_correctly_formatted_courses_table(t))


})
