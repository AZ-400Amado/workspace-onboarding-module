resource "tfe_workspace" "workspace" {
  for_each = toset(var.environment_names)

  name               = "${lower(var.application_id)}-${lower(each.value)}"
  description        = "Workspace for the ${each.value} environment of application ${var.application_id}"
  allow_destroy_plan = each.value == "prod" ? false : true

}

data "tfe_team" "admin_team" {
  name = var.admin_team_name
}

data "tfe_team" "user_team" {
  name = var.user_team_name
}

resource "tfe_team_access" "admin_team_access" {
  for_each = toset(var.environment_names)

  workspace_id = tfe_workspace.workspace[each.value].id
  team_id      = data.tfe_team.admin_team.id
  access       = "admin"
}

resource "tfe_team_access" "user_team_access" {
  for_each = toset(var.environment_names)

  workspace_id = tfe_workspace.workspace[each.value].id
  team_id      = data.tfe_team.user_team.id
  access       = "write"
}