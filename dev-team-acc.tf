provider "aws" {
  alias  = "dev-team-account"
  region = "ap-south-1"
  assume_role {
    role_arn = "arn:aws:iam::dev-team-account_id:role/Administrator"
  }
}

