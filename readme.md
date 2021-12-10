# Terraform SNS to Slack

Terraform for setting up [sns-to-slack](https://github.com/digirati-co-uk/sns-to-slack) lambda.

This contains 2 modules:
* `file` - Setup lambda using local zip file. Zip file location specified by `source_package` variable.
* `s3` - Setup lambda using zip file stored in s3. Zip location specified by `s3_bucket` and `s3_key` variables.