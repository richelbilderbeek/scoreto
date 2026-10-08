# Extracted from test-save_courses_as_csv.R:4

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "scoreto", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
filename <- tempfile()
expect_false(file.exists(filename))
save_courses_as_csv(filename)
