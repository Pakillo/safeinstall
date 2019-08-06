#' Safe installation of R packages from GitHub
#'
#' @param user.repo Repository address in the format `username/repo`.
#' @param ... Further options passed to [remotes::install_github()].
#' @param verbose Logical. Show verbose output?
#'
#' @return If no unsafe code is detected, the package is installed. Otherwise, an error message calling to inspect the repository for potential problems.
#' @export
#'
#' @examples
#' \dontrun{
#' library(safeinstall)
#' safe_install_github("Pakillo/safeinstall")
#' safe_install_github("ropenscilabs/testevil")
#' }

safe_install_github <- function(user.repo = NULL, ..., verbose = TRUE) {

  git.repo <- paste0("https://github.com/", user.repo, ".git")
  test.passed <- check_package(git.repo, verbose = verbose)

  if (isTRUE(test.passed)) {
    remotes::install_github(user.repo, ...)
  } else {
    stop("There might be some unsafe code in this repository. It is advised to inspect it more thoroughly before installing (e.g. try defender package: https://github.com/ropenscilabs/defender).")
  }

}


#' Check a package repository for potential security issues
#'
#' @param repo Link to an online git repository (e.g. "https://github.com/Pakillo/safeinstall.git")
#' @param verbose Logical. Show verbose output?
#'
#' @return TRUE if the package passes the security checks, otherwise FALSE (and some extra information about potential issues if verbose = TRUE).
#' @export
#'
#' @examples
#' \dontrun{
#' library(safeinstall)
#' check_package("https://github.com/Pakillo/safeinstall.git")
#' check_package("https://github.com/ropenscilabs/testevil.git")
#' }
check_package <- function(repo = NULL, verbose = TRUE) {

  # clone repo locally
  temp.dir <- "safetest"
  git2r::clone(repo, local_path = temp.dir, progress = FALSE)

  ## run defender tests

  # system calls
  test1 <- defender::summarize_system_calls(temp.dir)

  if (nrow(test1) > 0 & isTRUE(verbose)) {
    message("\n\nSystem calls found:\n")
    print(test1)
  }

  # dangerous imports
  test2 <- defender::check_namespace(temp.dir)

  if (nrow(test2) > 0 & isTRUE(verbose)) {
    message("\n\nDangerous imports found:\n")
    print(test2)
  }

  # delete temp dir
  unlink(temp.dir, recursive = TRUE, force = TRUE)

  # if there are zero rows, defender did not detect any problem
  if (any(nrow(test1), nrow(test2)) > 0) {
    test.passed <- FALSE
  } else {
    test.passed <- TRUE
  }

  test.passed
}


