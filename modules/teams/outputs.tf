output "id" {
  description = "The ID of the team."
  value       = tfe_team.this.id
}

output "team" {
  description = "Terraform Cloud team resource"
  value       = tfe_team.this
}