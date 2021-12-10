provider "aws" {
  region = "ap-south-1"
}


terraform {
  backend "s3" {
    bucket  = "aws-handler-backup"
    encrypt = true
    key     = "terraform.tfstate"
    region  = "ap-south-1"
  }
}
