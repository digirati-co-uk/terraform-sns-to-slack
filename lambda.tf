resource "aws_lambda_function" "sns_to_slack" {
  function_name    = "${var.prefix}-sns-to-slack"
  handler          = "main.lambda_handler"
  runtime          = "python2.7"
  filename         = "${var.source_package}"
  source_code_hash = "${base64sha256(file(var.source_package))}"

  role = "${aws_iam_role.sns_to_slack_exec_role.arn}"

  environment {
    variables = {
      SLACK_WEBHOOK_URL = "${var.slack_webhook_url}"
    }
  }
}

resource "aws_lambda_permission" "allow_sns_to_call_sns_to_slack" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.sns_to_slack.function_name}"
  principal     = "sns.amazonaws.com"
}
