output "id" {
  description = "The workspace ID."
  value       = tfe_workspace.this.id
}

output "resource_count" {
    description = "The number of resources managed by the workspace."
    value       = tfe_workspace.this.resource_count
}

output "" {
    description = "The URL to the browsable HTML overview of the workspace."
    value       = tfe_workspace.this.html_url
}

output "" {
    description = "Terraform Cloud workspace resource."
    value       = tfe_workspace.this
}