test_that("correct surprise_me output", {
  
  output <- surprise_me()
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 9)
  expect_equal(nrow(output), 7)
  expect_type(output$Genre, 'character')
  expect_equal(colnames(output)[5] , 'Runtime (in minutes)')
  #expect_equal(nrow(output), length(unique(output$Title)))
  expect_error(surprise_me('winter'), 'Please choose a valid genre.')
  
})