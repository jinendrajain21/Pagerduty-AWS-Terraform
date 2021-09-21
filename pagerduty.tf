provider "aws" {
  region = "us-east-1"
}
terraform {
  required_providers {
    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "1.11.0"
    }
  }
}
provider "pagerduty" {
  token = var.pager-token
}

####Create Pagerduty Service #######
resource "pagerduty_service" "pager-service" {
  name                    = "My web app"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.Priority-High-esc-policy.id
  alert_creation          = "create_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
}

data "pagerduty_vendor" "newrelic" {
  name = "New Relic"
}

resource "pagerduty_service_integration" "newrelic" {
  name    = data.pagerduty_vendor.newrelic.name
  service = pagerduty_service.pager-service.id
  vendor  = data.pagerduty_vendor.newrelic.id

}

data "pagerduty_vendor" "cloudwatch" {
  name = "Cloudwatch"
}
resource "pagerduty_service_integration" "cloudwatch" {
  name    = data.pagerduty_vendor.cloudwatch.name
  service = pagerduty_service.pager-service.id
  vendor  = data.pagerduty_vendor.cloudwatch.id
}
