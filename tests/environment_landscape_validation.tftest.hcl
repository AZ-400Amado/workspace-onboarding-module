provider "tfe" {
  organization = "sierra"
}
 
variables {
  admin_team_name = "admins-test"
  user_team_name  = "users-test"
  application_id  = "my-app"
}
 
run "setup" {
 
  module {
    source = "./tests/testing/setup"
  }
}
 
run "invalid_environment_landscape_missing_prod_name" {
 
  command = plan
 
  variables {
    environment_names = ["dev", "staging"]
    admin_team_name   = var.admin_team_name
    user_team_name    = var.user_team_name
    application_id    = var.application_id
  }
 
  expect_failures = [var.environment_names]
 
}
 
run "invalid_environment_landscape_incorrect_prod_name" {
 
  command = plan
 
  variables {
    environment_names = ["dev", "staging", "production"]
    admin_team_name   = var.admin_team_name
    user_team_name    = var.user_team_name
    application_id    = var.application_id
  }
 
  expect_failures = [var.environment_names]
 
}
 
run "valid_environment_landscape" {
 
  command = plan
 
  variables {
    environment_names = ["dev", "staging", "prod"]
    admin_team_name   = var.admin_team_name
    user_team_name    = var.user_team_name
    application_id    = var.application_id
  }
 
}
 
run "workspace_name_in_lowercase" {
 
  command = plan
 
  variables {
    environment_names = ["Dev", "Staging", "Prod"]
    admin_team_name   = var.admin_team_name
    user_team_name    = var.user_team_name
    application_id    = "My-App"
  }
 
  assert {
    condition     = alltrue([for ws in tfe_workspace.workspace : lower(ws.name) == ws.name])
    error_message = "All workspace names must be in lowercase."
  }
}