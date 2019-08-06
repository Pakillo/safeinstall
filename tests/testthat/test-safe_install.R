
test_that("safe_install of testevil gives error", {
  expect_error(safe_install_github("ropenscilabs/testevil"))
})

test_that("safe_install of safeinstall does not give error (installs)", {
  expect_true(is.character(safe_install_github("Pakillo/safeinstall")))
})
