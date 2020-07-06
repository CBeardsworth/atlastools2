context("between patch distance function")
testthat::test_that("simple distance works", {

  # make test positions
  testdf <- tibble::tibble(a_start = seq(10, 100, 10),
                           a_end = a_start + 2,
                           b_start = 1, b_end = 1)
  # run function
  testoutput <- atlastools::wat_bw_patch_dist(testdf,
                                               x1 = "a_end",
                                               x2 = "a_start",
                                               y1 = "b_end",
                                               y2 = "b_start")
  # do tests
  # should return as many elements as nrows in df
  testthat::expect_equal(length(testoutput), nrow(testdf),
                         info = "distances returned are not \\
                         same length as data provided")
  # test that the first element is NA
  testthat::expect_identical(testoutput[1], as.double(NA),
                             info = "first distance is not NA")
  # test that the vector class is numeric or double
  testthat::expect_type(testoutput, "double")

  # test that the distances except first are 1 in this case
  testthat::expect_identical(testoutput, c(NA, rep(8.0, 9)),
                             info = "the distance calculation is wrong")

})
