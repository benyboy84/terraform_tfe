variable "name" {
  description = "(Required) Name of the team."
  type        = string
}

variable "organization" {
  description = "(Required) Name of the organization. If omitted, organization must be defined in the provider config."
  type        = string
}

variable "visibility" {
  description = "(Optional) The visibility of the team (`secret` or `organization`)."
  type        = string
  default     = "organization"

  validation {
    condition     = var.visibility != null ? contains(["secret", "organization"], var.visibility) ? true : false : true
    error_message = "Valid values are `secret` or `organization`."
  }
}

variable "sso_team_id" {
  description = "(Optional) Unique Identifier to control team membership via SAML."
  type        = string
  default     = null
}

variable "organization_access" {
  description = <<DESCRIPTION
  (Optional) Settings for the team's organization access.
    read_projects           = (Optional) Allow members to view all projects within the organization. Requires read_workspaces to be set to true.
    manage_projects         = (Optional) Allow members to create and administrate all projects within the organization.
    read_workspaces         = (Optional) Allow members to view all workspaces in this organization.
    manage_workspaces       = (Optional) Allows members to create and administrate all workspaces within the organization.
    manage_policies         = (Optional) Allows members to create, edit, and delete the organization's Sentinel policies.
    manage_policy_overrides = (Optional) Allows members to override soft-mandatory policy checks.
    manage_run_tasks        = (Optional) Allow members to create, edit, and delete the organization's run tasks.
    manage_vcs_settings     = (Optional) Allows members to manage the organization's VCS Providers and SSH keys.
    manage_membership       = (Optional) Allow members to add/remove users from the organization, and to add/remove users from visible teams.
    manage_modules          = (Optional) Allow members to publish and delete modules in the organization's private registry.
    manage_providers        = (Optional) Allow members to publish and delete providers in the organization's private registry.
  DESCRIPTION
  type = object({
    read_projects           = optional(bool, false)
    manage_projects         = optional(bool, false)
    read_workspaces         = optional(bool, false)
    manage_workspaces       = optional(bool, false)
    manage_policies         = optional(bool, false)
    manage_policy_overrides = optional(bool, false)
    manage_run_tasks        = optional(bool, false)
    manage_vcs_settings     = optional(bool, false)
    manage_membership       = optional(bool, false)
    manage_modules          = optional(bool, false)
    manage_providers        = optional(bool, false)
  })
  default = null

  validation {
    condition     = var.organization_access != null ? var.organization_access.read_projects != false && var.organization_access.manage_projects != false ? false : true : true
    error_message = "Project access must be `read` or `manage`."
  }

  validation {
    condition     = var.organization_access != null ? var.organization_access.read_workspaces != false && var.organization_access.manage_workspaces != false ? false : true : true
    error_message = "Workspaces access must be `read` or `manage`."
  }

  validation {
    condition     = var.organization_access != null ? var.organization_access.manage_projects == true && var.organization_access.manage_workspaces != true ? false : true : true
    error_message = "`manage_projects` requires `manage_workspaces` to be set to `true`."
  }
}
