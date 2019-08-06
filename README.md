
<!-- README.md is generated from README.Rmd. Please edit that file -->

# safeinstall

<!-- badges: start -->

<!-- badges: end -->

The goal of safeinstall is to run some basic security checks before
installing an R package from an online repository (like GitHub). This
package is basically a wrapper of
[defender](https://github.com/ropenscilabs/defender) that runs some
checks before running `remotes::install_github`.

## Installation

``` r
devtools::install_github("Pakillo/safeinstall")
```

## Usage

`safe_install_github` will run some checks before installing the
package. If nothing is detected, the package is installed.

``` r
library(safeinstall)

safe_install_github("Pakillo/safeinstall")
```

In contrast, the package will not install if malicious/unsafe code is
potentially detected.

``` r
safe_install_github("ropenscilabs/testevil")
```
