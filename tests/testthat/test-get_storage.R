test_that("use", {
  expect_silent(get_storage())
})

test_that("file storage.csv is OK", {
  filename <- get_scoreto_path("storage.csv")
  text <- readr::read_lines(filename)
  n_commas <- stringr::str_count(text, ",")
  expect_true(all(n_commas == n_commas[1]))
})

