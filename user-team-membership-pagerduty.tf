#############USERS########
resource "pagerduty_user" "Jinendra" {
  name      = "var.user1"
  email     = "var.mail_id_user1"
  color     = "green"
  role      = "observer"
  job_title = "Soldier"
  teams     = ["${pagerduty_team.devops.id}"]
}

resource "pagerduty_user" "rupesh" {
  name      = "var.user2"
  email     = "var.mail_id_user2"
  color     = "red"
  role      = "observer"
  job_title = "Leader"
  teams     = ["${pagerduty_team.devops.id}", "${pagerduty_team.architect.id}"]
}


resource "pagerduty_user" "jack" {
  name      = "user3"
  email     = "var.mail_id_user3"
  color     = "blue"
  role      = "admin"
  job_title = "Head"
  teams     = ["${pagerduty_team.architect.id}"]
}
#########################TEAMS###################


resource "pagerduty_team" "devops" {
  name = "Devops"
}

resource "pagerduty_team" "architect" {
  name = "Architect"
}

###############Membership###########
resource "pagerduty_team_membership" "devops" {
  user_id = pagerduty_user.Jinendra.id
  team_id = pagerduty_team.devops.id
  role    = "observer"
}

resource "pagerduty_team_membership" "architect" {
  user_id = pagerduty_user.jack.id
  team_id = pagerduty_team.architect.id
  role    = "manager"
}
