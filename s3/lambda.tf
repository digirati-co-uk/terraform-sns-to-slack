resource "aws_lambda_function" "sns_to_slack_s3" {
  count         = length(var.source_package) > 0 ? 0 : 1
  function_name = "${var.prefix}-sns-to-slack"
  handler       = "main.lambda_handler"
  runtime       = "python3.9"
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key

  role = aws_iam_role.sns_to_slack_exec_role.arn

  environment {
    variables = {
      SLACK_WEBHOOK_URL = var.slack_webhook_url
    }
  }
}

resource "aws_lambda_permission" "allow_sns_to_call_sns_to_slack_s3" {
  count         = length(var.source_package) > 0 ? 0 : 1
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sns_to_slack_s3[0].function_name
  principal     = "sns.amazonaws.com"
}
