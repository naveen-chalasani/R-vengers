<!-- badges: start -->
[![R-CMD-check](https://github.com/naveen-chalasani/R.vengers/workflows/R-CMD-check/badge.svg)](https://github.com/naveen-chalasani/R.vengers/actions)  [![test-coverage](https://github.com/naveen-chalasani/R.vengers/workflows/test-coverage/badge.svg)](https://github.com/naveen-chalasani/R.vengers/actions)  [![Codecov test coverage](https://codecov.io/gh/naveen-chalasani/R.vengers/branch/main/graph/badge.svg)](https://codecov.io/gh/naveen-chalasani/R.vengers?branch=main)
<!-- badges: end -->

<!-- README.md is generated from README.Rmd. Please edit that file -->

# R.vengers

<!-- badges: start -->
<!-- badges: end -->

```R.vengers``` is a package to wrap the RESTful API http://www.omdbapi.com/.

The OMDb API is a RESTful web service to obtain movie information, all content and images on the site are contributed and maintained by their users. For more information, visit their website: http://www.omdbapi.com/

The API for the OMDb webservices can be accessed here: http://www.omdbapi.com/

Welcome to the R.vengers package! Below, users will find instructions on how to use functions to return information about movies, tv-series, or games.
- The 'Table of Functions' provides a brief summary of each function in this package.
- Additionally, a detailed tutorial with examples is provided in the vignette.

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

avengers_movies()
surprise_me()
```

## Table of Functions
| Function | Description |
|:--|:-----|
| `avengers_movies` |  returns a dataframe with information of all Marvel Avengers movies  |
| `get_top10_recommendations` |  returns a dataframe of the top 10 recommended movies/tv-series based on specified genre |
| `surprise_me` |  returns a dataframe with titles and information to a random list of movies/tv-series based on specified genre  |
| `get_actors` |  returns a dataframe with a column containing the actors of a movie, tv-series, or game |
| `get_awards` |  returns a dataframe with a column containing the awards won by a movie, tv-series, or game  |
| `get_director` |  returns a dataframe with a column containing the director(s)  of a movie, tv-series, or game  |
| `get_genre` |  returns a dataframe with a column containing the genre(s) of a movie, tv-series, or game  |
| `get_poster` |  returns a dataframe with a column containing the link to a visual poster of a movie, tv-series, or game  |
| `get_rating` |  returns a dataframe with a column containing the IMDB Rating of a movie, tv-series, or game  |
| `get_runtime` |  returns a dataframe with a column containing the runtime of a movie, tv-series, or game  |
| `get_writer` |  returns a dataframe with a column containing the writer(s) of a movie, tv-series, or game  |
| `read_plot` |  returns a dataframe with a column containing the full plot of a movie, tv-series, or game  |
| `search_all` |  returns a dataframe with attributes and information to a list of movies, tv-series, or games  |

## Code of Conduct

Please note that the R.vengers project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.