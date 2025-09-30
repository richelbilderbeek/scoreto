test_that("minimal use", {
  expect_equal(get_logo_path("AIDA Data Hub"), "logo/aida_logo_24_x_24.png")
  expect_equal(get_logo_path("NAISS"), "logo/naiss_logo_148_x_24.png")
  expect_equal(get_logo_path("PDC"), "logo/pdc_logo_21_x_24.png")
  expect_equal(get_logo_path("SciLifeLab"), "logo/sll_logo_110_x_24.png")
  expect_equal(get_logo_path("UPPMAX"), "logo/uppmax_logo_116_x_24.png")
  expect_equal(get_logo_path("SND"), "logo/snd_logo_83_x_24.png")
  expect_equal(get_logo_path("SLUBI"), "logo/slubi_logo_20_x_24.png")

  expect_error(get_logo_path("Nonsense"), "Invalid provider name")
  expect_error(
    get_logo_path(c("NAISS", "UPPMAX")),
    "Provide exactly one provider name"
  )


  expect_silent(get_logo_path("EOSC"))
  expect_silent(get_logo_path("Swestore"))
  expect_silent(get_logo_path("University of Gothenburg"))

  expect_error(get_logo_path("researchdata.se"))
  expect_silent(get_logo_path("Doris SND"))
  expect_silent(get_logo_path("Stockholm University"))
  expect_silent(get_logo_path("FEGA Sweden"))
  expect_silent(get_logo_path("GBIF"))
  expect_silent(get_logo_path("SITES"))
  expect_silent(get_logo_path("SBDI"))

})

test_that("all providers have a logo", {
  for (n in get_all_providers()) {
    expect_silent(get_logo_path(n))
  }
})
