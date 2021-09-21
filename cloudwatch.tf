
resource "aws_cloudwatch_metric_alarm" "CPU" {
  alarm_name          = "web-CPU-ec2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "0.05"
  alarm_description   = "monitor the CPU utilazation"
  alarm_actions       = [aws_sns_topic.pagerdutysns.arn]
  dimensions = {
    InstanceId = aws_instance.PagerDuty-instance.id
  }
}
resource "aws_cloudwatch_metric_alarm" "Health" {
  alarm_name          = "web-Health-ec2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "0.05"
  alarm_description   = "monitor the Health of EC2 utilazation"
  alarm_actions       = [aws_sns_topic.pagerdutysns.arn]
  dimensions = {
    InstanceId = aws_instance.PagerDuty-instance.id
  }

}
