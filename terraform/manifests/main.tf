terraform {
  backend "s3" {
    key = "website.tfstate"
  }
}

provider "aws" {
  version = "~> 2.25"
}

