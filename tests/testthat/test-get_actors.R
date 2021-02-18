test_that("errors for incorrect input", {
  
  expect_error(get_actors('winter', 'summer'), "Type is invalid. Please use one of these : movie, series, episode, game")
  expect_error(get_actors(), "No input provided. Please search again.")
  
})

test_that("correct actors output", {
  
  output <- get_actors('black', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 4)
  expect_type(output$Actors, 'character')
  expect_equal(colnames(output)[4] , 'Actors')
  expect_equal(get_actors('in black'), get_actors('in+black'))
  expect_match(sample(output[[1]], 1), '*black*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})