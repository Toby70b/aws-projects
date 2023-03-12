module "lambda_function" {
  source = "registry.terraform.io/terraform-aws-modules/lambda/aws"
  function_name = "lambda-error-formatter"
  description   = "Lambda which subscribes to CloudWatch logs looking for errors to format before forwarding onto SNS"
  architectures = ["x86_64"]
  attach_policies    = true
  number_of_policies = 1
  policies           = [module.iam_policy.arn]
  environment_variables = {
    SNS_TOPIC_ARN = module.sns_topic.topic_arn
  }
  handler     = "lambda-error-reporter.lambda_handler"
  runtime     = "python3.8"
  source_path = "../src/lambda-error-reporter.py"

  tags        = local.common_tags
}

module "iam_policy" {
  source      = "registry.terraform.io/terraform-aws-modules/iam/aws//modules/iam-policy"
  name        = "LambdaErrorFormatterPublishPolicy-${random_uuid.policy_suffix_uuid.result}"
  description = "Policy enabling resource to publish to lambda-error-reporter topic"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sns:Publish",
            "Resource": "${module.sns_topic.topic_arn}"
        }
    ]
}
  EOF

  tags = local.common_tags
}

resource "random_uuid" "policy_suffix_uuid" {
}

module "sns_topic" {
  source       = "registry.terraform.io/terraform-aws-modules/sns/aws"
  name         = "lambda-error-reporter"
  display_name = "Lambda Error Reporter"

  subscriptions = var.subscriptions

  tags = local.common_tags
}
