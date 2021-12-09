resource "aws_s3_bucket" "test_bucket" {
  bucket = "aws-test-bucket-twinkle14"
  acl    = "private"
}
