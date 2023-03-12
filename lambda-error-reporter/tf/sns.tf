module "sns_topic" {
  source       = "registry.terraform.io/terraform-aws-modules/sns/aws"
  name         = "lambda-error-reporter"
  display_name = "Lambda Error Reporter"

  subscriptions = var.subscriptions

  tags = local.common_tags
}
