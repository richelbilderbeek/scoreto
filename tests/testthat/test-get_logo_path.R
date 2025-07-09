test_that("minimal use", {
  expect_equal(get_logo_path("AIDA Data Hub"), "logo/aida_logo_24_x_24.png")
  expect_equal(get_logo_path("NAISS"), "logo/naiss_logo_inverted_148_x_24.png")
  expect_equal(get_logo_path("PDC"), "logo/pdc_logo_21_x_24.png")
  expect_equal(get_logo_path("SciLifeLab"), "logo/sll_logo_110_x_24.png")
  expect_equal(get_logo_path("UPPMAX"), "logo/uppmax_logo_116_x_24.png")
})

test_that("all providers have a logo", {
  for (n in get_all_providers()) {
    expect_silent(get_logo_path(n))
  }
})
