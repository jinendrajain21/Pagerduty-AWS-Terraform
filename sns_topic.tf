resource "aws_sns_topic" "pagerdutysns" {
  name = "Pagerdutysns"
}

resource "aws_sns_topic_subscription" "pagerdutysnsub" {
  topic_arn                       = aws_sns_topic.pagerdutysns.arn
  protocol                        = "https"
  endpoint                        = "https://events.pagerduty.com/integration/${pagerduty_service_integration.cloudwatch.integration_key}/enqueue"
  confirmation_timeout_in_minutes = "3"
  endpoint_auto_confirms          = "true"
}
