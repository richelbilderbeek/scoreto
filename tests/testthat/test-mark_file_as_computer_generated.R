test_that("use", {
  text <- c(
    "# My file",
    " ",
    "Some text"
  )
  filename <- tempfile()
  readr::write_lines(text, filename)
  mark_file_as_computer_generated(filename)
  new_text <- readr::read_lines(filename)
  expect_false(all(text == new_text))
})

test_that("use file with markdown", {
  filename <- tempfile()
  dir.create(dirname(filename), showWarnings = FALSE)
  file.copy(from = get_scoreto_path("compute_1.md"), to = filename, overwrite = TRUE)

  before <- readr::read_lines(filename)
  mark_file_as_computer_generated(filename)
  after <- readr::read_lines(filename)

  expect_true(before[8] == "```mermaid")
  expect_true(before[9] == "flowchart TD")
  expect_true(before[10] == "")
  expect_true(before[11] == "  subgraph researcher_on_sensitive_data[Researcher, sensitive data]")

  expect_true(after[8] == before[8])
  expect_true(after[9] == before[9])
  expect_true(after[10] == "") # Should be left untouched
  expect_true(after[11] == before[11])

  expect_false(all(before == after))
})

test_that("use file with markdown", {
  filename <- tempfile()
  dir.create(dirname(filename), showWarnings = FALSE)
  file.copy(from = get_scoreto_path("storage_1.md"), to = filename, overwrite = TRUE)

  before <- readr::read_lines(filename)
  mark_file_as_computer_generated(filename)
  after <- readr::read_lines(filename)

  expect_true(before[15] == "```mermaid")
  expect_true(before[16] == "flowchart TD")
  expect_true(before[17] == "")
  expect_true(before[18] == "  question_need_repo[Do you want to work actively on the data?]")

  expect_true(after[15] == before[15])
  expect_true(after[16] == before[16])
  expect_true(after[17] == "") # Should be left untouched
  expect_true(after[18] == before[18])

  expect_false(all(before == after))
})
