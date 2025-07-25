% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_correctly_formatted_storage_table.R
\name{is_correctly_formatted_storage_table}
\alias{is_correctly_formatted_storage_table}
\title{Determine if the table is correctly formatted}
\usage{
is_correctly_formatted_storage_table(t)
}
\arguments{
\item{t}{a table}
}
\value{
TRUE if the table is correctly formatted
}
\description{
Determine if the table is correctly formatted
}
\examples{
is_correctly_formatted_storage_table(get_storage()) # True
is_correctly_formatted_storage_table("Nonsense") # False
}
