test_that("minimal use", {

  for (provider_name in get_all_providers()) {
    home_url <- get_provider_home_url(provider_name)
    expect_equal(1, length(home_url))
  }
})

test_that("use", {
  expect_equal(get_provider_home_url("AIDA Data Hub"), "https://datahub.aida.scilifelab.se")
  expect_equal(get_provider_home_url("LUNARC"), "https://www.lunarc.lu.se")
  expect_equal(get_provider_home_url("C3SE"), "https://www.c3se.chalmers.se")
  expect_equal(get_provider_home_url("Code Refinery"), "https://coderefinery.org")
  expect_equal(get_provider_home_url("CSC"), "https://www.lumi.csc.fi/public")
  expect_equal(get_provider_home_url("Doris SND"), "https://www.snd.se/en/doris-researchers")
  expect_equal(get_provider_home_url("UPPMAX"), "https://www.uu.se/en/centre/uppmax.html")
  expect_equal(get_provider_home_url("NSC"), "https://www.nsc.liu.se")
  expect_equal(get_provider_home_url("ENCCS"), "https://enccs.se")
  expect_equal(get_provider_home_url("EOSC"), "https://eosc.eu")
  expect_equal(get_provider_home_url("FEGA Sweden"), "https://fega.nbis.se")
  expect_equal(get_provider_home_url("HPC2N"), "https://www.hpc2n.umu.se")
  expect_equal(get_provider_home_url("SLUBI"), "https://www.slubi.se")
  expect_equal(get_provider_home_url("SciLifeLab"), "https://scilifelab.se")
  expect_equal(get_provider_home_url("GBIF Sweden"), "...")

  skip("All homepages")
  expect_equal(get_provider_home_url("InfraViz"), "...")
  expect_equal(get_provider_home_url("Mimer"), "...")
  expect_equal(get_provider_home_url("NAISS"), "...")
  expect_equal(get_provider_home_url("OSCU"), "...")
  expect_equal(get_provider_home_url("PDC"), "...")
  expect_equal(get_provider_home_url("SBDI"), "...")
  expect_equal(get_provider_home_url("SITES"), "...")
  expect_equal(get_provider_home_url("SND"), "...")
  expect_equal(get_provider_home_url("Stockholm University"), "...")
  expect_equal(get_provider_home_url("Swestore"), "...")
  expect_equal(get_provider_home_url("University of Gothenburg"), "...")
})
