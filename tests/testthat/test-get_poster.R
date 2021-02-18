test_that("errors for incorrect input", {
  
  expect_error(get_poster('winter', 'summer'), "Type is invalid. Please use one of these : movie, series, episode, game")
  expect_error(get_poster(), "No input provided. Please search again.")
  
})


test_that("correct poster output", {
  
  output <- get_poster('glass', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 4)
  expect_type(output$`Poster (link)`, 'character')
  expect_equal(colnames(output)[4] , 'Poster (link)')
  expect_equal(get_poster('the glass'), get_poster('the+glass'))
  expect_match(sample(output[[1]], 1), '*glass*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})