% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_pdc_course_urls.R
\name{extract_pdc_course_urls}
\alias{extract_pdc_course_urls}
\title{Extract the URL of a course from an PDC courses text}
\usage{
extract_pdc_course_urls(
  pdc_courses_text,
  pdc_training_url = "https://www.pdc.kth.se/"
)
}
\arguments{
\item{pdc_courses_text}{subset of raw HTML from the PDC website.}

\item{pdc_training_url}{The URL for the PDC courses}
}
\value{
a collection of strings and NAs
}
\description{
Extract the URL of a course from an PDC courses text
}
