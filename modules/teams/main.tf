resource "tfe_team" "this" {

  name         = var.name
  organization = var.organization
  visibility   = var.visibility
  sso_team_id  = var.sso_team_id

  dynamic "organization_access" {
    for_each = var.organization_access != null ? [true] : []
    content {
      read_projects           = var.organization_access.read_projects
      manage_projects         = var.organization_access.manage_projects
      read_workspaces         = var.organization_access.read_workspaces
      manage_workspaces       = var.organization_access.manage_workspaces
      manage_policies         = var.organization_access.manage_policies
      manage_policy_overrides = var.organization_access.manage_policy_overrides
      manage_run_tasks        = var.organization_access.manage_run_tasks
      manage_vcs_settings     = var.organization_access.manage_vcs_settings
      manage_membership       = var.organization_access.manage_membership
      manage_modules          = var.organization_access.manage_modules
      manage_providers        = var.organization_access.manage_providers
    }
  }
}