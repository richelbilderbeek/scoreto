test_that("use", {
  markdown_text <- "Test"
  created <- surround_markdown_with_lintignore(markdown_text = markdown_text)
  expect_equal(5, length(created))
  expect_equal(
    created[1],
    "<!-- markdownlint-disable MD060 --><!-- The pipes must not line up -->"
  )
  expect_equal(created[2],"")
  expect_equal(created[3],"Test")
  expect_equal(created[4],"")
  expect_equal(
    created[5],
    "<!-- markdownlint-enable MD060 -->"
  )
})

test_that("use", {
  markdown_text <- c("Line 1", "Line 2")
  created <- surround_markdown_with_lintignore(markdown_text = markdown_text)
  expect_equal(6, length(created))
  expect_equal(
    created[1],
    "<!-- markdownlint-disable MD060 --><!-- The pipes must not line up -->"
  )
  expect_equal(created[2],"")
  expect_equal(created[3],"Line 1")
  expect_equal(created[4],"Line 2")
  expect_equal(created[5],"")
  expect_equal(
    created[6],
    "<!-- markdownlint-enable MD060 -->"
  )
})
