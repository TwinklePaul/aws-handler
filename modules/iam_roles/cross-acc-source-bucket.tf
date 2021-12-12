resource "aws_iam_role" "cross-account-transfer-source-bucket-role" {
  name = "cross-account-transfer-source-bucket-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "S3ReplicationRole"
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "s3.amazonaws.com"
        },
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "crossaccounttransfer-source-bucket-role-attachment" {
  policy_arn = [aws_iam_policy.cross-account-transfer-source-bucket-policy.arn]
  role       = aws_iam_role.cross-account-transfer-source-bucket-role.id
}
