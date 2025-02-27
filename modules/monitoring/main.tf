resource "aws_xray_group" "my_xray" {
  group_name = "my-xray-group"
  filter_expression = "request.url LIKE \"*\""
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name = "/aws/lambda/my_lambda_function"
  retention_in_days = 30
}

