
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
```

> Error in safe\_install\_github(“ropenscilabs/testevil”) : There might
> be some unsafe code in this repository. It is advised to inspect it
> more thoroughly before installing (e.g. try defender package:
> <https://github.com/ropenscilabs/defender>).
