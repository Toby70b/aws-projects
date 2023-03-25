remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {

    bucket         = get_env("BUCKET")
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = get_env("REGION")
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
