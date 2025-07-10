test_that("us", {

  expect_false(is_correctly_formatted_table("nonensse"))
  expect_false(is_correctly_formatted_table(tibble::tibble()))

  # Incorrect number of names
  t <- tibble::tibble(
    date_from = "2025-01-01"
  )
  expect_false(is_correctly_formatted_table(t))

  # Incorrect names
  t <- tibble::tibble(
    wrong_date_from = "2025-01-01",
    date_to = "2025-01-01",
    course_name = "Some course title",
    course_url = "https://someplace.org/schedule",
    provider_courses_url = "https://someplace.org",
    provider_name = "Some provider"
  )
  expect_false(is_correctly_formatted_table(t))

  # Incorrect date format
  t <- tibble::tibble(
    wrong_date_from = "March 14",
    date_to = "March 14",
    course_name = "Some course title",
    course_url = "https://someplace.org/schedule",
    provider_courses_url = "https://someplace.org",
    provider_name = "Some provider"
  )
  expect_false(is_correctly_formatted_table(t))

  # Incorrect value for date_from
  t <- tibble::tibble(
    date_from = NA,
    date_to = "March 14",
    course_name = "Some course title",
    course_url = "https://someplace.org/schedule",
    provider_courses_url = "https://someplace.org",
    provider_name = "Some provider"
  )
  expect_false(is_correctly_formatted_table(t))

  # Incorrect value for course_url
  t <- tibble::tibble(
    date_from = "2025-01-01",
    date_to = "2025-01-01",
    course_name = "Some course title",
    course_url = NA,
    provider_courses_url = "https://someplace.org",
    provider_name = "Some provider"
  )
  expect_false(is_correctly_formatted_table(t))


  # Correct
  t <- tibble::tibble(
    date_from = "2025-01-01",
    date_to = "2025-01-01",
    course_name = "Some course title",
    course_url = "https://someplace.org/schedule",
    provider_courses_url = "https://someplace.org",
    provider_name = "Some provider"
  )

  expect_true(is_correctly_formatted_table(t))
})
