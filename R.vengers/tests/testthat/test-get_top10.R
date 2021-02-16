test_that("correct recommendation output", {
  
  output <- get_top10_recommendations('drama')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 9)
  expect_type(output$Actors, 'character')
  expect_equal(colnames(output)[5] , 'Runtime (in minutes)')
  expect_match(sample(output[[4]], 1), '*drama*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})