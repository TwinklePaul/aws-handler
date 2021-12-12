resource "aws_iam_role" "cross-account-transfer-dest-user-role" {
  name = "cross-account-transfer-dest-user-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "ReplicationDestnUserRole"
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "crossaccounttransfer-source-bucket-role-attachment" {
  role       = aws_iam_role.cross-account-transfer-dest-user-role.id
  group      = [aws_iam_group.feature-group]
  policy_arn = [aws_iam_policy.cross-account-transfer-dest-user-policy.arn]
}
