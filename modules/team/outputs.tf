output "team_id" {
  description = "The ID of the team."
  value       = tfe_team.this.id
}

output "team" {
  description = "Terraform Cloud team resource"
  value       = tfe_team.this
}

output "team_project_access_id" {
  description = "The team project access ID."
  value       = var.project_id != null ? tfe_team_project_access.this[0].id : null
}

output "team_project_access" {
  description = "Terraform Cloud team project access resource"
  value       = var.project_id != null ? tfe_team_project_access.this[0] : null
}