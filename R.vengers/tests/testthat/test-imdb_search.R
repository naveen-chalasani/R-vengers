library(jsonlite)

test_that("errors for incorrect input", {
  
  expect_error(imdb_search('abcdefg'), "Incorrect IMDb ID.")
  expect_error(imdb_search('!!!'), "Incorrect IMDb ID.")
  expect_error(imdb_search('1234567'), "Incorrect IMDb ID.")
  
})


test_that("correct imdb_id output", {
  
  output <- imdb_search('tt2015381')
  expect_type(output, 'list')
  expect_equal(output$imdbID, 'tt2015381')
  
})
