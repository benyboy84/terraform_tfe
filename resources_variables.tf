# The following code block is used to create variable resources.

module "variable_workspace" {
  source = "./modules/variable"

  key          = "test"
  value        = "test"
  category     = "env"
  workspace_id = "ws-pfsWc8bcFrDgxF4V"
}

module "variable_set" {
  source = "./modules/variable"

  key               = "variable"
  value             = "value"
  category          = "env"
  sensitive         = true
  variable_set_name = "variable_set"
  global            = true
  organization      = data.tfe_organization.this.name
}

module "variable_set_project" {
  source = "./modules/variable"

  key               = "variable_"
  value             = "value"
  category          = "env"
  sensitive         = true
  variable_set_name = "variable_set_project"
  organization      = data.tfe_organization.this.name
  variable_set_project_name = "Azure Landing Zone"
  variable_set_project_id   = tfe_project.project["Azure Landing Zone"].id
}