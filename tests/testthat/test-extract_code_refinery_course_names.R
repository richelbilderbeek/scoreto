test_that("use", {
  code_refinery_courses_text <- get_code_refinery_test_courses_text()
  course_names <- extract_code_refinery_course_names(code_refinery_courses_text)
  expect_equal(length(code_refinery_courses_text), length(course_names))
})


test_that("use", {
  text <- "<li><a rel=\"external\" href=\"https://coderefinery.github.io/2026-03-17-workshop/\">CodeRefinery tools workshop (online)</a> - March 17-19 and 24-26 2026 (compact format)</li>" # nolint
  course_names <- extract_code_refinery_course_names(text = text)
  expect_equal("CodeRefinery tools workshop (online)", course_names)
})

