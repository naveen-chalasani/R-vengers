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

You can install the released version of R.vengers from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("R.vengers")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("naveen-chalasani/R-vengers")
```
## Example

This is a basic example which shows you how to solve a common problem:

```{r example}
library(R.vengers)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`? You can include R chunks like so:

```{r cars}
summary(cars)
```

You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

```{r pressure, echo = FALSE}
plot(pressure)
```

In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN.

## Code of Conduct

Please note that the R.vengers project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
