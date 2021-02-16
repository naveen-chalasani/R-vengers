test_that("correct actors output", {
  
  output <- get_actors('black', 'movie')
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 4)
  expect_is(output$Actors, 'character')
  expect_equal(colnames(output)[4] , 'Actors')
  expect_equal(get_actors('in black'), get_actors('in+black'))
  expect_match(sample(output[[1]], 1), '*black*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})