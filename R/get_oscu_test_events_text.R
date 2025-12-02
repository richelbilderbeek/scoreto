#' Get a testing text for OSCU events
#'
#' This text is a patchwork of entries from the OSCU website
#' collected over time.
#' @return a text to extract the dates from
#' @export
get_oscu_test_events_text <- function() {
  c(
    "<li>Linux Command Line 101, 20 October 2025, ONLINE </li>",
    "<li>Introduction to running R, Julia, and Matlab in HPC, 6-8 October 2025, ONLINE, Given under NAISS, cooperation with LUNARC and UPPMAX </li>", # nolint: line_length_linter
    "<li><a href=\"https://www.oscu.umu.se/events/events/2025/fall/1/selecting-modules\">Selecting Software Modules</a>, 10 September 2025, ONLINE, Given under NAISS, cooperation with UPPMAX and LUNARC</li>", # nolint: line_length_linter
    "<li><a href=\"https://www.oscu.umu.se/events/events/2025/fall/intro-kebnekaise\">Introduction to Kebnekaise</a>, 9 September 2025, ONLINE.</li>", # nolint: line_length_linter
    "<li><a href=\"https://www.oscu.umu.se/events/events/2025/fall/1/intro-linux\">Introduction to Linux</a>, 8 September 2025, ONLINE. Given under NAISS, cooperation with LUNARC and UPPMAX</li>", # nolint: line_length_linter
    "<li>Cluster architecture and job submission, 26 August, ONLINE. Given under NAISS, cooperation with UPPMAX and LUNARC. </li>", # nolint: line_length_linter
    "<li><a href=\"https://www.oscu.umu.se/events/events/2025/spring/intermediate-linux\">Intermediate Bash and Linux</a>, 2-3 June 2025, ONLINE. Given under NAISS, cooperation with UPPMAX.</li>", # nolint: line_length_linter
    "<li>Intermediate Bash, aka Command Line 201, 4-5 December </li>",
    "<li>Introduction to running Python in HPC + Using Python in an HPC environment, 27 Nov, 28 Nov, Dec 1, Dec 2</li>"# nolint: line_length_linter
  )
}
