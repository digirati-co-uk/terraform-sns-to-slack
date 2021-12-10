resource "aws_sns_topic_subscription" "sns_to_slack_subscription_s3" {
  topic_arn = var.sns_topic_arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.sns_to_slack_s3.arn
}
