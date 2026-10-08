# Extracted from test-get_code_refinery_courses.R:2

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "scoreto", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
t <- get_code_refinery_courses()
