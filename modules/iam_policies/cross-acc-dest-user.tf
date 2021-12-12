data "aws_iam_policy_document" "cross-account-transfer-dest-user-policy-document" {
  statement {
    sid    = "SourceBucketPermissions"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject"
    ]
    resources = [
      "${cross-account-transfer-source-bucket.id}",
      "${cross-account-transfer-source-bucket.id}/*",
    ]
  }
  statement {
    sid    = "DestinationBucketPermissions"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = [
      "${cross-account-transfer-destn-bucket.id}",
      "${cross-account-transfer-destn-bucket.id}/*"
    ]
  }
}

resource "aws_iam_policy" "cross-account-transfer-dest-user-policy" {
  name        = "cross-account-transfer-dest-user-policy"
  path        = "/"
  description = "Cross-Account Bucket Replication Policy for destination bucket's IAM Users"
  policy      = data.aws_iam_policy_document.cross-account-transfer-dest-user-policy-document.json
}
