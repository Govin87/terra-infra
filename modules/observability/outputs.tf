output "xray_rule_name" {
  value = aws_xray_sampling_rule.default.rule_name
}

output "cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.log_group.name
}

