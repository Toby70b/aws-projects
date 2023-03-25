terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-33578"
    key = "terraform-remote-backend/terraform.tfstate"
    region = "eu-west-2"

    dynamodb_table = "terraform-state-lock"
    encrypt = "true"
  }
}

provider "aws" {
  region = var.aws_region
}
