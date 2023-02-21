resource "aws_iam_role" "lambda_custom_role" {
  name = "lambda_custom_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_custom_policy" {
  name = "lambda_custom_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
   {
           "Effect": "Allow",
           "Action": [
               "codebuild:UpdateProject",
               "codebuild:BatchGetBuilds",
               "codebuild:StartBuild"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "codecommit:GetBranch",
               "codecommit:GetCommit",
               "codecommit:CreateCommit",
               "codecommit:CreateRepository",
               "codecommit:DeleteRepository",
               "codecommit:GetRepository",
               "codecommit:TagResource"
           ],
           "Resource": [
               "*"
           ]
       },
      {
           "Effect": "Allow",
           "Action": [
              "s3:GetObject",
              "s3:PutObject"
           ],
           "Resource": "*"
       },
      {
           "Effect": "Allow",
           "Action": [
                "kafka:Describe*",
                "kafka:Get*",
                "kafka:List*"
           ],
           "Resource": "*"
       },
      {
           "Effect": "Allow",
           "Action": [
                  "dynamodb:BatchGetItem",
                  "dynamodb:GetItem",
                  "dynamodb:Query",
                  "dynamodb:Scan",
                  "dynamodb:BatchWriteItem",
                  "dynamodb:PutItem",
                  "dynamodb:UpdateItem"
           ],
           "Resource": "*"
       },
       
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_custom_attachment" {
  policy_arn = aws_iam_policy.lambda_custom_policy.arn
  role = aws_iam_role.lambda_custom_role.name
}

