output "variable_id" {
  description = "The ID of the variable."
  value       = tfe_variable.this.id
}

output "readable_value" {
  description = "Only present if the variable is non-sensitive. A copy of the value which will not be marked as sensitive in plan outputs."
  value       = tfe_variable.this.readable_value
}

output "variable" {
  description = "Terraform Cloud variable resource."
  value       = tfe_variable.this
}

output "variable_set_id" {
  description = "The ID of the variable set."
  value       = var.variable_set_name != null ? tfe_variable_set.this[0].id : null
}

output "variable_set" {
  description = "Terraform Cloud variable_set resource."
  value       = var.variable_set_name != null ? tfe_variable_set.this[0] : null
}

output "workspace_variable_set_attachment_id" {
  description = "The ID of the variable set attachment. ID format: `<workspace-id>_<variable-set-id>`"
  value       = var.workspace_name != null ? tfe_workspace_variable_set.this[0].id : null
}

output "workspace_variable_set_attachment" {
  description = "Terraform Cloud workspace_variable_set resource."
  value       = var.workspace_name != null ? tfe_workspace_variable_set.this[0] : null
}

output "project_variable_set_attachment_id" {
  description = "The ID of the variable set attachment. ID format: `<project-id>_<variable-set-id>`"
  value       = var.project_name != null ? tfe_project_variable_set.this[0].id : null
}

output "project_variable_set_attachment" {
  description = "Terraform Cloud project_variable_set resource."
  value       = var.project_name != null ? tfe_project_variable_set.this[0] : null
}