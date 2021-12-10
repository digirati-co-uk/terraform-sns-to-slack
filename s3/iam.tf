data "aws_iam_policy_document" "sns_to_slack_exec_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "sns_to_slack_exec_role" {
  name               = "${var.prefix}-sns-to-slack-exec-role"
  assume_role_policy = data.aws_iam_policy_document.sns_to_slack_exec_role.json
}

resource "aws_iam_role_policy_attachment" "sns_to_slack_logging" {
  role       = aws_iam_role.sns_to_slack_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
