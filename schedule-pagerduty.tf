##############Pagerduty Schedule############
resource "pagerduty_schedule" "PAGER1-schedule" {
  name      = "On-call - Pager1"
  time_zone = "America/New_York"
  layer {
    name                         = "Layer 1"
    rotation_turn_length_seconds = 604800
    start                        = "2021-10-01T12:00:00-04:00"
    rotation_virtual_start       = "2021-10-01T12:00:00-04:00"
    users                        = ["${pagerduty_user.Jinendra.id}", "${pagerduty_user.rupesh.id}"]
  }
}

resource "pagerduty_schedule" "PAGER2-schedule" {
  name      = "On-call - Pager2"
  time_zone = "America/New_York"
  layer {
    name                         = "Layer 1"
    rotation_turn_length_seconds = 604800
    start                        = "2021-10-01T12:00:00-04:00"
    rotation_virtual_start       = "2021-10-01T12:00:00-04:00"
    users                        = ["${pagerduty_user.jack.id}"]
  }
}
