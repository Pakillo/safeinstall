
test_that("safe_install of testevil gives error", {
  expect_error(safe_install_github("ropenscilabs/testevil"))
})


