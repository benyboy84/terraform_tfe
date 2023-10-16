resource "tfe_variable" "this" {
  key             = var.key
  value           = var.value
  category        = var.category
  description     = var.variable_description
  hcl             = var.hcl
  sensitive       = var.sensitive
  workspace_id    = var.workspace_id
  variable_set_id = var.variable_set_id

  lifecycle {
    precondition {
      condition     = var.workspace_id != null && var.variable_set_id != null || var.workspace_id == null && var.variable_set_id == null ? false : true
      error_message = "`workspace_id` or `variable_set_id` variable must be provided."
    }
  }
}

resource "tfe_variable_set" "this" {
  count = var.variable_set_name != null ? 1 : 0

  name         = var.variable_set_name
  description  = var.variable_set_description
  global       = var.global
  organization = var.organization
}

resource "tfe_workspace_variable_set" "this" {
  count = var.workspace_name != null ? 1 : 0

  variable_set_id = var.variable_set_id
  workspace_id    = var.workspace_id
}

resource "tfe_project_variable_set" "this" {
  count = var.project_name != null ? 1 : 0

  variable_set_id = var.variable_set_id
  project_id      = var.project_id
}