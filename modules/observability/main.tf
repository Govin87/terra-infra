resource "aws_cloudwatch_log_group" "log_group" {
  name              = "caesers-log"
  retention_in_days = 30
}
resource "aws_xray_sampling_rule" "default" {
  rule_name      = "default-rule"
  priority       = 1
  fixed_rate     = 0.05
  reservoir_size = 5
  service_name   = "*"
  service_type   = "*"
  host           = "*"
  http_method    = "*"
  url_path       = "*"
  resource_arn   = "*"
  version        = 1
}

