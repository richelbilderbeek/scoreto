test_that("minimal use", {

  for (provider_name in get_all_providers()) {
    home_url <- get_provider_courses_url(provider_name)
    expect_equal(1, length(home_url))
  }
})

test_that("specific use", {
  expect_equal(get_provider_courses_url("ENCCS"), "https://enccs.se/events")
  expect_equal(get_provider_courses_url("SLUBI"), "https://www.slubi.se/courses.html")
  expect_equal(get_provider_courses_url("SciLifeLab"), "https://training.scilifelab.se/events")
  expect_equal(get_provider_courses_url("PDC"), "https://www.pdc.kth.se/about/events")
  expect_equal(get_provider_courses_url("C3SE"), "https://www.c3se.chalmers.se")
  expect_equal(get_provider_courses_url("CSC"), "https://lumi-supercomputer.eu/events")
  expect_equal(get_provider_courses_url("LUNARC"), "https://www.lunarc.lu.se/learning-more/training-courses")
  expect_equal(get_provider_courses_url("Mimer"), "https://mimer-ai.eu/events-and-learning")
  expect_equal(get_provider_courses_url("NAISS"), "https://www.naiss.se/training")
  expect_equal(get_provider_courses_url("NSC"), "https://www.nsc.liu.se/support/Events")
  expect_equal(get_provider_courses_url("SciLifeLab"), "https://training.scilifelab.se/events")
})
