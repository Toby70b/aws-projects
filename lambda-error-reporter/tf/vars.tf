variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "eu-west-2"
}

variable "subscriptions" {
  type        = any
  description = "subscribers to the SNS topic"
}
