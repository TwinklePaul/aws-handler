resource "aws_s3_bucket" "cross-account-transfer-destn-bucket" {
  bucket = "cross-account-transfer-destn-bucket"
  acl    = "private"
}
