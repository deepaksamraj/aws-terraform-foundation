resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.project}-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 80

  alarm_description   = "Alarm when EC2 CPU exceeds 80% for 2 minutes"
  alarm_actions       = [] # No SNS yet, but can be added later

  dimensions = {
    InstanceId = var.instance_id
  }
}
