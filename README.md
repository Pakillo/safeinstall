
<!-- README.md is generated from README.Rmd. Please edit that file -->

# safeinstall

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/Pakillo/safeinstall.svg?branch=master)](https://travis-ci.org/Pakillo/safeinstall)
[![Codecov test
coverage](https://codecov.io/gh/Pakillo/safeinstall/branch/master/graph/badge.svg)](https://codecov.io/gh/Pakillo/safeinstall?branch=master)
<!-- badges: end -->

The goal of `safeinstall` is to run some basic security checks before
installing an R package from an online repository (like GitHub). This
package is basically a wrapper of
[defender](https://github.com/ropenscilabs/defender) that runs some
checks before running `remotes::install_github`.

## Installation

``` r
remotes::install_github("Pakillo/safeinstall")
```

## Usage

``` r
library(safeinstall)
```

`safe_install_github` will run some checks before installing the
package. If nothing is detected, the package is installed.

``` r
safe_install_github("Pakillo/safeinstall")
```

In contrast, the package will not install if potentially unsafe code is
detected.

``` r
safe_install_github("ropenscilabs/testevil")
#> System calls found:
#>                path line_number                     call
#> 1   inst/root_sys.R           1            system2("ls")
#> 2   inst/root_sys.R           4             system("ls")
#> 3      R/exported.R           7            system2("ls")
#> 4      R/internal.R           4             system("ls")
#> 5      R/internal.R           8         system("ls -la")
#> 6      R/processx.R           3      processx::run("ls")
#> 7           R/sys.R           8 sys::exec_internal("ls")
#> 8 R/system_hidden.R           2            system2("lm")
#>        function_name
#> 1            system2
#> 2             system
#> 3            system2
#> 4             system
#> 5             system
#> 6      processx::run
#> 7 sys::exec_internal
#> 8            system2
#> Dangerous imports found:
#>       type        import  package
#> 1  package           sys      sys
#> 2  package      processx processx
#> 3 function processx::run processx
#> Error in safe_install_github("ropenscilabs/testevil"): There might be some unsafe code in this repository. It is advised to inspect it more thoroughly before installing (e.g. try defender package: https://github.com/ropenscilabs/defender).
```
