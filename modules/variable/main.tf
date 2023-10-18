resource "tfe_variable" "this" {
  key             = var.key
  value           = var.value
  category        = var.category
  description     = var.variable_description
  hcl             = var.hcl
  sensitive       = var.sensitive
  workspace_id    = var.workspace_id
  variable_set_id = try(tfe_variable_set.this[0].id, null)

  lifecycle {
    precondition {
      condition     = var.workspace_id != null && var.variable_set_name != null || var.workspace_id == null && var.variable_set_name == null ? false : true
      error_message = "`workspace_id` or `variable_set_name` variable must be provided."
    }
  }
}

resource "tfe_variable_set" "this" {
  count = var.variable_set_name != null ? 1 : 0

  name         = var.variable_set_name
  description  = var.variable_set_description
  global       = var.global
  organization = var.organization

  lifecycle {
    precondition {
      condition     = var.global ? var.variable_set_workspace_name == null && var.variable_set_project_name == null ? true : false : true
      error_message = "`global` cannot be set to true if `variable_set_workspace_name` or `variable_set_project_name` is defined."
    }
  }
}

data "tfe_workspace" "this" {
  for_each = var.variable_set_workspace_name != null ? toset(var.variable_set_workspace_name) : []

  name         = each.value
  organization = var.organization
}

resource "tfe_workspace_variable_set" "this" {
  for_each = var.variable_set_workspace_name != null ? toset(var.variable_set_workspace_name) : []

  variable_set_id = tfe_variable_set.this[0].id
  workspace_id    = data.tfe_workspace.this["${each.value}"].id
}

data "tfe_project" "this" {
  for_each = var.variable_set_project_name != null ? toset(var.variable_set_project_name) : []

  name         = each.value
  organization = var.organization
}

resource "tfe_project_variable_set" "this" {
  for_each = var.variable_set_project_name != null ? toset(var.variable_set_project_name) : []

  variable_set_id = tfe_variable_set.this[0].id
  project_id      = data.tfe_project.this["${each.value}"].id
}