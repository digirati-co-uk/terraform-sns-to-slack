resource "aws_sns_topic_subscription" "sns_to_slack_subscription_file" {
  count     = length(var.source_package) > 0 ? 1 : 0
  topic_arn = var.sns_topic_arn
  protocol  = "lambda"
  endpoint  = join("", aws_lambda_function.sns_to_slack_file.*.arn)
}

resource "aws_sns_topic_subscription" "sns_to_slack_subscription_s3" {
  count     = length(var.source_package) > 0 ? 0 : 1
  topic_arn = var.sns_topic_arn
  protocol  = "lambda"
  endpoint  = join("", aws_lambda_function.sns_to_slack_s3.*.arn)
}
