#' Get the path to the logo of a provider of computational resources
#' @param provider_name the name of a provider of computational resources
#' @return the path to the logo
#' @export
get_logo_path <- function(provider_name) {
  if (length(provider_name) != 1) {
    msg <- paste0(
      "Provide exactly one provider name to 'get_logo_path'. ",
      "Provider names given: '",
      stringr::str_flatten_comma(provider_name),
      "'. ",
      "Tip: use 'get_logo_paths' for multiple logo paths."
    )
    stop(msg)
  }
  if (!is_provider(provider_name)) {
    msg <- paste0(
      "Invalid provider name '", provider_name, "'. ",
      "Use a valid provider name instead. ",
      "Valid provider names are ",
      stringr::str_flatten_comma(get_all_providers())
    )
    stop(msg)
  }
  if (provider_name == "AIDA Data Hub") return("logo/aida_logo_24_x_24.png")
  if (provider_name == "C3SE") return("logo/c3se_logo_134_x_24.png")
  if (provider_name == "Code Refinery") return("logo/coderefinery_logo_32_x_24.png") # nolint
  if (provider_name == "CSC") return("logo/csc_logo_31_x_24.png")
  if (provider_name == "ENCCS") return("logo/enccs_logo_103_x_24.png")
  if (provider_name == "EOSC") return("logo/eosc_logo_77_x_24.png")
  if (provider_name == "HPC2N") return("logo/hpc2n_logo_84_x_24.png")
  if (provider_name == "InfraViz") return("logo/infraviz_logo_47_x_24.png")
  if (provider_name == "LUNARC") return("logo/lunarc_logo_42_x_24.png")
  if (provider_name == "NAISS") return("logo/naiss_logo_148_x_24.png")
  if (provider_name == "NSC") return("logo/nsc_logo_66_x_24.png")
  if (provider_name == "PDC") return("logo/pdc_logo_21_x_24.png")
  if (provider_name == "SciLifeLab") return("logo/sll_logo_110_x_24.png")
  if (provider_name == "Swestore") return("logo/swestore_logo_24_x_24.png")
  if (provider_name == "University of Gothenburg") return("logo/university_of_gothenburg_logo_24_x_24.png")

  testthat::expect_equal(
    object = provider_name,
    expected = "UPPMAX",
    info = paste0(
      "Provider with name '", provider_name, "' ",
      "does not have a logo yet. "
    )
  )
  "logo/uppmax_logo_116_x_24.png"
}
