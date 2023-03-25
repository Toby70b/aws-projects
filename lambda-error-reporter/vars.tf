variable "aws_region" {
  description = "Region for AWS Resources"
  type        = string
  default     = "eu-west-2"
}

variable "subscriptions" {
  description = "subscribers to the SNS topic"
  type        = any
}
