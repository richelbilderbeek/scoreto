#' Check if the table is correctly formatted, will \link{stop} if not
#' @param t a table
#' @return Nothing. Will \link{stop} with a proper error message when
#' the table is not formed correctly
#' @export
check_courses_table <- function(t) { # nolint indeed a long function name

  if (!tibble::is_tibble(t)) stop("'t' is not a tibble, but a '", paste0(class(t), collapse = " "), "'")
  expected_names <- c(
    "date_from",
    "date_to",
    "course_name",
    "course_url",
    "provider_courses_url",
    "provider_name"
  )
  n_names_expected <- length(expected_names)
  if (length(names(t)) != n_names_expected) {
    stop(
      "'t' has the invalid amount of names. \n",
      "Expected: ", n_names_expected, ". \n",
      "Supplied: ", length(names(t))
    )
  }
  if (!all(names(t) == expected_names)) {
    stop(
      "'t' has incorrect column names. \n",
      "Expected: '", paste0(expected_names, collapse = ", "), "'. \n",
      "Supplied: '", paste0(names(t), collapse = ", "), "'. "
    )
  }
  if (nrow(t) == 0) return(invisible(t))
  if (any(is.na(t$course_url))) {
    stop(
      "'t' has an NA as a course URL. \n",
      "Row indices: ", paste(which(is.na(t$course_url)), collapse = " "), "\n",
      "Course names: ", paste(t$course_name[is.na(t$course_url)], collapse = ", ")
    )
  }
  if (any(is.na(t$date_from))) {
    stop(
      "'t' has an NA as a from date. \n",
      "Row indices: ", paste(which(is.na(t$date_from)), collapse = " "), "\n",
      "Course names: ", paste(t$course_name[is.na(t$date_from)], collapse = ", ")
    )
  }
  if (any(is.na(t$date_to))) {
    stop(
      "'t' has an NA as a to date. \n",
      "Row indices: ", paste(which(is.na(t$date_to)), collapse = " "), "\n",
      "Course names: ", paste(t$course_name[is.na(t$date_to)], collapse = ", ")
    )
  }
  if (any(!scoreto::are_valid_urls(t$course_url))) {
    stop(
      "'t' has malformed course URLs. \n",
      "Row indices: ", paste(which(!scoreto::are_valid_urls(t$course_url)), collapse = " "), "\n",
      "Malformed course URLs: ", paste(t$course_url[!scoreto::are_valid_urls(t$course_url)], collapse = ", "), "\n",
      "Course names: ", paste(t$course_name[!scoreto::are_valid_urls(t$course_url)], collapse = ", ")
    )
  }
  if (any(!scoreto::are_valid_urls(t$provider_courses_url))) {
    stop(
      "'t' has malformed course URLs. \n",
      "Row indices: ", paste(which(!scoreto::are_valid_urls(t$provider_courses_url)), collapse = " "), "\n",
      "Malformed course URLs: ", paste(t$provider_courses_url[!scoreto::are_valid_urls(t$provider_courses_url)], collapse = ", "), "\n",
      "Course names: ", paste(t$course_name[!scoreto::are_valid_urls(t$provider_courses_url)], collapse = ", ")
    )
  }
  if (any(!scoreto::are_correctly_formatted_dates(t$date_from))) {
    stop(
      "'t' has malformed from dates. \n",
      "Row indices: ", paste(which(!!scoreto::are_correctly_formatted_dates(t$date_from)), collapse = " "), "\n",
      "Malformed from dates: ", paste(t$date_from[!scoreto::are_correctly_formatted_dates(t$date_from)], collapse = ", "), "\n",
      "Course names: ", paste(t$course_name[!scoreto::are_correctly_formatted_dates(t$date_from)], collapse = ", ")
    )
  }
  if (any(!scoreto::are_correctly_formatted_dates(t$date_to))) {
    stop(
      "'t' has malformed to dates. \n",
      "Row indices: ", paste(which(!!scoreto::are_correctly_formatted_dates(t$date_to)), collapse = " "), "\n",
      "Malformed to dates: ", paste(t$date_to[!scoreto::are_correctly_formatted_dates(t$date_to)], collapse = ", "), "\n",
      "Course names: ", paste(t$course_name[!scoreto::are_correctly_formatted_dates(t$date_to)], collapse = ", ")
    )
  }
  invisible(t)
}
