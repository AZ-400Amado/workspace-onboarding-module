output "workspace_ids" {
  description = "The IDs of the created workspaces"
  value       = { for k, v in tfe_workspace.workspace : k => v.id }
}
 
output "admin_team_ids" {
  description = "The IDs of the admin teams"
  value       = data.tfe_team.admin_team.id
}
 
output "user_team_ids" {
  description = "The IDs of the user teams"
  value       = data.tfe_team.user_team.id
}