resource "aws_s3_bucket" "cross-account-transfer-source-bucket" {
  bucket = "cross-account-transfer-source-bucket"
  acl    = "private"
}
