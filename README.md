# Terraform Workspaces Module
 
## Description
 
This module configures one or more workspaces for an application team, with one workspace corresponding to one SDLC environment. It uses the TFE provider to create workspaces in HCP Terraform.
 
## Usage
 
```hcl
module "workspaces" {
  source            = "path/to/your/module"
  environment_names = ["dev", "staging", "prod"]
  admin_team_name   = "admin-team"
  user_team_name    = "user-team"
  application_id    = "my-app"
}
```
 
## Inputs
 
| Name              | Description                                      | Type        | Default     | Required |
|-------------------|--------------------------------------------------|-------------|-------------|----------|
| environment_names | A list of environment names                      | list(string)| n/a         | yes      |
| admin_team_name   | The name of the team for the workspace administrators | string      | n/a         | yes      |
| user_team_name    | The name of the team for the workspace users     | string      | n/a         | yes      |
| application_id    | The identifier of the application                | string      | n/a         | yes      |
 
 
## Outputs
 
| Name                | Description                              |
|---------------------|------------------------------------------|
| workspace_ids       | The IDs of the created workspaces        |
| admin_team_ids      | The IDs of the admin teams               |
| user_team_ids       | The IDs of the user teams                |