test_that("errors for incorrect input", {
  
  expect_error(imdb_search('abcdefg'), "Incorrect IMDb ID.")
  expect_error(imdb_search('!!!'), "Incorrect IMDb ID.")
  expect_error(imdb_search('1234567'), "Incorrect IMDb ID.")
  expect_is(imdb_search('tt2015381'), "list")
  
})
