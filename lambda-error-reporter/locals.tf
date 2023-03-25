locals {
  common_tags = {
    project   = "lambda-error-reporter"
    terraform = "true"
  }
  lambda_file_name = "lambda_error_reporter"
}
