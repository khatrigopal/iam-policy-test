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
               "codecommit:ListRepositories",
               "codecommit:UploadArchive",
               "codecommit:GetUploadArchiveStatus"
           ],
           "Resource": "*"
       },
       {
           "Effect": "Allow",
           "Action": [
               "codepipeline:CreatePipeline",
               "codepipeline:DeletePipeline",
               "codepipeline:GetPipeline",
               "codepipeline:GetPipelineState",
               "codepipeline:StartPipelineExecution",
               "codepipeline:TagResource",
               "codepipeline:UpdatePipeline"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "cognito-idp:CreateUserPool",
               "cognito-idp:TagResource"
           ],
           "Resource": "*",
           "Condition": {
               "ForAnyValue:StringLike": {
                   "aws:TagKeys": [
                       "sagemaker:launch-source"
                   ]
               }
           }
       },
       {
           "Effect": "Allow",
           "Action": [
               "cognito-idp:CreateGroup",
               "cognito-idp:CreateUserPoolDomain",
               "cognito-idp:CreateUserPoolClient",
               "cognito-idp:DeleteGroup",
               "cognito-idp:DeleteUserPool",
               "cognito-idp:DeleteUserPoolClient",
               "cognito-idp:DeleteUserPoolDomain",
               "cognito-idp:DescribeUserPool",
               "cognito-idp:DescribeUserPoolClient",
               "cognito-idp:UpdateUserPool",
               "cognito-idp:UpdateUserPoolClient"
           ],
           "Resource": "*",
           "Condition": {
               "StringLike": {
                   "*"
               }
           }
       },
       {
           "Effect": "Allow",
           "Action": [
               "ecr:CreateRepository",
               "ecr:DeleteRepository",
               "ecr:TagResource"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "events:DescribeRule",
               "events:DeleteRule",
               "events:DisableRule",
               "events:EnableRule",
               "events:PutRule",
               "events:PutTargets",
               "events:RemoveTargets"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "firehose:CreateDeliveryStream",
               "firehose:DeleteDeliveryStream",
               "firehose:DescribeDeliveryStream",
               "firehose:StartDeliveryStreamEncryption",
               "firehose:StopDeliveryStreamEncryption",
               "firehose:UpdateDestination"
           ],
           "*"
       },
       {
           "Effect": "Allow",
           "Action": [
               "glue:GetDatabase",
               "glue:CreateDatabase",
               "glue:CreateTable",
               "glue:DeleteDatabase"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "glue:CreateClassifier",
               "glue:DeleteClassifier",
               "glue:DeleteCrawler",
               "glue:DeleteJob",
               "glue:DeleteTrigger",
               "glue:DeleteWorkflow",
               "glue:StopCrawler"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "glue:CreateWorkflow"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "glue:CreateJob"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "glue:CreateCrawler",
               "glue:GetCrawler"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "glue:CreateTrigger",
               "glue:GetTrigger"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "iam:PassRole"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "lambda:AddPermission",
               "lambda:CreateFunction",
               "lambda:DeleteFunction",
               "lambda:GetFunction",
               "lambda:GetFunctionConfiguration",
               "lambda:InvokeFunction",
               "lambda:RemovePermission"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": "lambda:TagResource",
           "Resource": [
               "arn:aws:lambda:*:*:function:flutter*"
           ],
           "Condition": {
               "ForAllValues:StringLike": {
                   "aws:TagKeys": [
                       "sagemaker:*"
                   ]
               }
           }
       },
       {
           "Effect": "Allow",
           "Action": [
               "logs:CreateLogGroup",
               "logs:CreateLogStream",
               "logs:DeleteLogGroup",
               "logs:DeleteLogStream",
               "logs:DescribeLogGroups",
               "logs:DescribeLogStreams",
               "logs:PutRetentionPolicy"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": "s3:GetObject",
           "Resource": "*",
           "Condition": {
               "StringEquals": {
                   "s3:ExistingObjectTag/servicecatalog:provisioning": "true"
               }
           }
       },
       {
           "Effect": "Allow",
           "Action": "s3:GetObject",
           "Resource": [
               "arn:aws:s3:::flutter*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "s3:CreateBucket",
               "s3:DeleteBucket",
               "s3:DeleteBucketPolicy",
               "s3:GetBucketPolicy",
               "s3:PutBucketAcl",
               "s3:PutBucketNotification",
               "s3:PutBucketPolicy",
               "s3:PutBucketPublicAccessBlock",
               "s3:PutBucketLogging",
               "s3:PutEncryptionConfiguration",
               "s3:PutBucketCORS",
               "s3:PutBucketTagging",
               "s3:PutObjectTagging"
           ],
           "Resource": "*"
       },
       {
           "Effect": "Allow",
           "Action": [
               "sagemaker:CreateEndpoint",
               "sagemaker:CreateEndpointConfig",
               "sagemaker:CreateModel",
               "sagemaker:CreateWorkteam",
               "sagemaker:DeleteEndpoint",
               "sagemaker:DeleteEndpointConfig",
               "sagemaker:DeleteModel",
               "sagemaker:DeleteWorkteam",
               "sagemaker:DescribeModel",
               "sagemaker:DescribeEndpointConfig",
               "sagemaker:DescribeEndpoint",
               "sagemaker:DescribeWorkteam",
               "sagemaker:CreateCodeRepository",
               "sagemaker:DescribeCodeRepository",
               "sagemaker:UpdateCodeRepository",
               "sagemaker:DeleteCodeRepository"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": [
               "sagemaker:AddTags"
           ],
           "Resource": [
               "*"
           ],
           "Condition": {
               "ForAllValues:StringLike": {
                   "aws:TagKeys": [
                       "sagemaker:*"
                   ]
               }
           }
       },
       {
           "Effect": "Allow",
           "Action": [
               "sagemaker:CreateImage",
               "sagemaker:DeleteImage",
               "sagemaker:DescribeImage",
               "sagemaker:UpdateImage",
               "sagemaker:ListTags"
           ],
           "Resource": [
               "*"
           ]
       },
       {
           "Effect": "Allow",
           "Action": "codestar-connections:PassConnection",
           "Resource": "*",
           "Condition": {
               "StringEquals": {
                   "codestar-connections:PassedToService": "codepipeline.amazonaws.com"
               }
           }
       }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_custom_attachment" {
  policy_arn = aws_iam_policy.lambda_custom_policy.arn
  role = aws_iam_role.lambda_custom_role.name
}

