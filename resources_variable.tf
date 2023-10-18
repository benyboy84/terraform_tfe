# resource "tfe_variable_set" "this" {
#   for_each = local.variable_sets

#   name         = each.value.name
#   description  = each.value.description
#   global       = each.value.global
#   organization = data.tfe_organization.this.name

#   # lifecycle {
#   #   precondition {
#   #     condition     = var.global ? var.variable_set_workspace_name == null && var.variable_set_project_name == null ? true : false : true
#   #     error_message = "`global` cannot be set to true if `variable_set_workspace_name` or `variable_set_project_name` is defined."
#   #   }
#   # }
# }

# resource "tfe_workspace_variable_set" "this" {
#   for_each = {for k, v in local.variable_sets : for w, workspaces in toset(v.workspaces) : b } 
#   # if try(v.workspaces, null) != null
#   variable_set_id = tfe_variable_set.this[k].id
#   workspace_id    = module.workspaces["${a}"].id
# }

# resource "tfe_project_variable_set" "this" {
#   for_each = var.variable_set_project_name != null ? toset(var.variable_set_project_name) : []

#   variable_set_id = tfe_variable_set.this[0].id
#   project_id      = data.tfe_project.this["${each.value}"].id
# }






# resource "tfe_variable" "this" {
#   key             = var.key
#   value           = var.value
#   category        = var.category
#   description     = var.variable_description
#   hcl             = var.hcl
#   sensitive       = var.sensitive
#   workspace_id    = var.workspace_id
#   variable_set_id = try(tfe_variable_set.this[0].id, null)

#   lifecycle {
#     precondition {
#       condition     = var.workspace_id != null && var.variable_set_name != null || var.workspace_id == null && var.variable_set_name == null ? false : true
#       error_message = "`workspace_id` or `variable_set_name` variable must be provided."
#     }
#   }
# }



# data "tfe_workspace" "this" {
#   for_each = var.variable_set_workspace_name != null ? toset(var.variable_set_workspace_name) : []

#   name         = each.value
#   organization = var.organization
# }



# data "tfe_project" "this" {
#   for_each = var.variable_set_project_name != null ? toset(var.variable_set_project_name) : []

#   name         = each.value
#   organization = var.organization
# }









# # The following code block is used to create variable resources.

# module "variable_workspace" {
#   source = "./modules/variable"

#   key          = "test"
#   value        = "test"
#   category     = "env"
#   workspace_id = "ws-pfsWc8bcFrDgxF4V"
# }

# module "variable_set" {
#   source = "./modules/variable"

#   key               = "variable"
#   value             = "value"
#   category          = "env"
#   sensitive         = true
#   variable_set_name = "variable_set"
#   global            = true
#   organization      = data.tfe_organization.this.name
# }

# module "variable_set_project" {
#   source = "./modules/variable"

#   key               = "variable_"
#   value             = "value"
#   category          = "env"
#   sensitive         = true
#   variable_set_name = "variable_set_project"
#   organization      = data.tfe_organization.this.name
#   variable_set_project_name = ["Azure Landing Zone"]
#   #variable_set_project_id   = tfe_project.project["Azure Landing Zone"].id
# }


# output "variable_id" {
#   description = "The ID of the variable."
#   value       = module.variable_set_project.variable_id
# }

# output "readable_value" {
#   description = "Only present if the variable is non-sensitive. A copy of the value which will not be marked as sensitive in plan outputs."
#   value       = module.variable_set_project.readable_value
# }

# output "variable_set_id" {
#   description = "The ID of the variable set."
#   value       = module.variable_set_project.variable_set_id
# }

# output "variable_set" {
#   description = "Terraform Cloud variable_set resource."
#   value       = module.variable_set_project.variable_set
# }

# output "workspace_variable_set_attachment_id" {
#   description = "The ID of the variable set attachment. ID format: `<workspace-id>_<variable-set-id>`"
#   value       = module.variable_set_project.workspace_variable_set_attachment_id
# }

# output "workspace_variable_set_attachment" {
#   description = "Terraform Cloud workspace_variable_set resource."
#   value       = module.variable_set_project.workspace_variable_set_attachment
# }

# output "project_variable_set_attachment_id" {
#   description = "The ID of the variable set attachment. ID format: `<project-id>_<variable-set-id>`"
#   value       = module.variable_set_project.project_variable_set_attachment_id
# }

# output "project_variable_set_attachment" {
#   description = "Terraform Cloud project_variable_set resource."
#   value       = module.variable_set_project.project_variable_set_attachment
# }