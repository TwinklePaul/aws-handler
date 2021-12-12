
data "aws_iam_policy_document" "cross-account-transfer-source-bucket-policy-document" {
  statement {
    sid    = "DelegateS3Access"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject"
    ]
    resources = []
  }
}

resource "aws_iam_policy" "cross-account-transfer-source-bucket-policy" {
  name        = "cross-account-transfer-source-bucket-policy"
  path        = "/"
  description = "Cross-Account Bucket Replication Policy for Source Bucket"
  policy      = data.aws_iam_policy_document.cross-account-transfer-source-bucket-policy-document.json
}


