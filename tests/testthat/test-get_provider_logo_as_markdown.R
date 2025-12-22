test_that("use", {
  expect_equal(
    get_provider_logo_as_markdown("UPPMAX"),
    "[![UPPMAX](logo/uppmax_logo_116_x_24.png)](https://www.uu.se/en/centre/uppmax.html)" # nolint
  )
})
