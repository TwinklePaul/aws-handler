provider "aws" {
  alias  = "feat-team-account"
  region = "ap-south-1"
  assume_role {
    role_arn = [aws_iam_role.cross-account-transfer-dest-user-role.arn]
  }
}

