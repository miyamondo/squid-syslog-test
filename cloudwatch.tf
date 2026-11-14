resource "aws_cloudwatch_log_group" "miya_ssm_logs" {
  name              = "/ssm/session-manager-logs"
  retention_in_days = 3
}