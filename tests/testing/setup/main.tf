resource "tfe_team" "admin_team" {
  name = "admins-test"
}
 
resource "tfe_team" "user_team" {
  name = "users-test"
}