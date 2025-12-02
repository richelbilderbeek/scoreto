test_that("use", {
  expect_equal(
    get_oscu_events_url(),
    "https://open-science-community-uppsala.github.io/open_science_community_uppsala/events/events/"
  )
})
