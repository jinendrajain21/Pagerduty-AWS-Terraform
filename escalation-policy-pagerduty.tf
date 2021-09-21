###########EscaltionPolicy###################
resource "pagerduty_escalation_policy" "Priority-High-esc-policy" {
  name      = "priority-high Policy"
  num_loops = 5

  rule {
    escalation_delay_in_minutes = 15
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.PAGER1-schedule.id
    }
  }
  rule {
    escalation_delay_in_minutes = 15
    target {
      type = "user_reference"
      id   = pagerduty_user.Jinendra.id
    }
  }
}

resource "pagerduty_escalation_policy" "Priority-Low-esc-policy" {
  name      = "Decepticons Policy"
  num_loops = 5

  rule {
    escalation_delay_in_minutes = 15
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.PAGER2-schedule.id
    }
  }
  rule {
    escalation_delay_in_minutes = 15
    target {
      type = "user_reference"
      id   = pagerduty_user.jack.id
    }
  }
}
