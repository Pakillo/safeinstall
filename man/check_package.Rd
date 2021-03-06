% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/safe_install.R
\name{check_package}
\alias{check_package}
\title{Check a package repository for potential security issues}
\usage{
check_package(repo = NULL, verbose = TRUE)
}
\arguments{
\item{repo}{Link to an online git repository (e.g. "https://github.com/Pakillo/safeinstall.git")}

\item{verbose}{Logical. Show verbose output?}
}
\value{
TRUE if the package passes the security checks, otherwise FALSE (and some extra information about potential issues if verbose = TRUE).
}
\description{
Check a package repository for potential security issues
}
\examples{
\dontrun{
library(safeinstall)
check_package("https://github.com/Pakillo/safeinstall.git")
check_package("https://github.com/ropenscilabs/testevil.git")
}
}
