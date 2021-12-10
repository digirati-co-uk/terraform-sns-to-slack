variable "prefix" {
  description = "Prefix to give to AWS resources"
}

variable "slack_webhook_url" {
  description = "Slack Webhook URL"
}

variable "source_package" {
  description = "Path of Lambda package zip"
  default     = ""
}

variable "s3_bucket" {
  description = "S3 bucket that Lambda package zip can be found in"
  default     = ""
}

variable "s3_key" {
  description = "S3 key that Lambda package zip can be found at"
  default     = ""
}

variable "sns_topic_arn" {
  description = "ARN of the SNS Topic to subscribe to"
}

variable "tags" {
  description = "Map of tags to apply to AWS resources"
  type        = map(string)
}
