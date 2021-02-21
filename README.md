<!-- badges: start -->
[![R-CMD-check](https://github.com/naveen-chalasani/R.vengers/workflows/R-CMD-check/badge.svg)](https://github.com/naveen-chalasani/R.vengers/actions)  [![test-coverage](https://github.com/naveen-chalasani/R.vengers/workflows/test-coverage/badge.svg)](https://github.com/naveen-chalasani/R.vengers/actions)  [![Codecov test coverage](https://codecov.io/gh/naveen-chalasani/R.vengers/branch/main/graph/badge.svg)](https://codecov.io/gh/naveen-chalasani/R.vengers?branch=main)
<!-- badges: end -->

<!-- README.md is generated from README.Rmd. Please edit that file -->

```{r, include = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)
```

# R.vengers

<!-- badges: start -->
<!-- badges: end -->

```R.vengers``` is a package to wrap the RESTful API http://www.omdbapi.com/.

The OMDb API is a RESTful web service to obtain movie information, all content and images on the site are contributed and maintained by their users. For more information, visit their website: http://www.omdbapi.com/

The API for the OMDb webservices can be accessed here: http://www.omdbapi.com/

## Installation

You can install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("naveen-chalasani/R.vengers")
```
## Example

This is a basic example which shows you how to solve a common problem:

```{r example}
library(R.vengers)
## basic example code

avengers_movies()
surprise_me()
```
