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

resource "tfe_team_project_access" "this" {

  count = var.project_id != null ? 1 : 0

  team_id    = tfe_team.this.id
  project_id = var.project_id
  access     = var.project_access

  dynamic "project_access" {
    for_each = var.custom_project_access != null ? [true] : []
    content {
      settings = var.project_access.settings
      teams    = var.project_access.teams
    }
  }

  dynamic "workspace_access" {
    for_each = var.custom_workspace_access != null ? [true] : []
    content {
      runs           = var.workspace_access.runs
      sentinel_mocks = var.workspace_access.sentinel_mocks
      state_versions = var.workspace_access.state_versions
      variables      = var.workspace_access.variables
      create         = var.workspace_access.create
      locking        = var.workspace_access.locking
      delete         = var.workspace_access.delete
      move           = var.workspace_access.move
      run_tasks      = var.workspace_access.run_tasks
    }
  }

}

resource "tfe_team_token" "this" {
  count = var.token ? 1 : 0

  team_id          = tfe_team.this.id
  force_regenerate = var.token_force_regenerate
  expired_at       = var.token_expired_at

}