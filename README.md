
<!-- README.md is generated from README.Rmd. Please edit that file -->

# solvergater.solvers

<!-- badges: start -->

<!-- badges: end -->

The package contains code that handles some particular external PDE
solvers.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("maciejsmolka/solvergater.solvers")
```

## Usage

This is a basic example which shows you how to run an MT solver:

``` r
if (FALSE) {
  library(solvergater.solvers)
  mts <- mt_solver()
  mt_obj <- objective(mts, mt_data$exact_qoi, 
                      precision = mt_data$precision_levels[2]
                      )
  mt_obj(c(1, 2, 3, 4))
}
```
