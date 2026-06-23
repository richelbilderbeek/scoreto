test_that("test", {
  base_url <- scoreto::get_provider_courses_url("NAISS")
  relative_urls = c(
    "../../course_adverts/2026/awk_August_2026",
    "../../../NAISS-intro-week",
    "../../../transfer-102/",
    "../../course_adverts/2026/apptainer_October_2026"
  )
  urls <- parse_urls(base_url = base_url, relative_urls = relative_urls)
  expect_equal(length(relative_urls), length(urls))
})
