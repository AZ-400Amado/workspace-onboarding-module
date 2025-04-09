variable "environment_names" {
  description = "A list of environment names"
  type        = list(string)
 
  validation {
    condition     = contains([for env in var.environment_names : lower(env)], "prod")
    error_message = "The list of environment names must contain 'prod'."
  }
}
 
variable "admin_team_name" {
  description = "The name of the team for the workspace administrators"
  type        = string
}
 
variable "user_team_name" {
  description = "The name of the team for the workspace users"
  type        = string
}
 
variable "application_id" {
  description = "The identifier of the application"
  type        = string
}
