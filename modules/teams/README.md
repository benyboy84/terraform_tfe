<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.3.1)

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (0.48.0)

## Providers

The following providers are used by this module:

- <a name="provider_tfe"></a> [tfe](#provider\_tfe) (0.48.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [tfe_team.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/team) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: (Required) Name of the team.

Type: `string`

### <a name="input_organization"></a> [organization](#input\_organization)

Description: (Required) Name of the organization. If omitted, organization must be defined in the provider config.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_organization_access"></a> [organization\_access](#input\_organization\_access)

Description:   (Optional) Settings for the team's organization access.  
    read\_projects           = (Optional) Allow members to view all projects within the organization. Requires read\_workspaces to be set to true.  
    manage\_projects         = (Optional) Allow members to create and administrate all projects within the organization.  
    read\_workspaces         = (Optional) Allow members to view all workspaces in this organization.  
    manage\_workspaces       = (Optional) Allows members to create and administrate all workspaces within the organization.  
    manage\_policies         = (Optional) Allows members to create, edit, and delete the organization's Sentinel policies.  
    manage\_policy\_overrides = (Optional) Allows members to override soft-mandatory policy checks.  
    manage\_run\_tasks        = (Optional) Allow members to create, edit, and delete the organization's run tasks.  
    manage\_vcs\_settings     = (Optional) Allows members to manage the organization's VCS Providers and SSH keys.  
    manage\_membership       = (Optional) Allow members to add/remove users from the organization, and to add/remove users from visible teams.  
    manage\_modules          = (Optional) Allow members to publish and delete modules in the organization's private registry.  
    manage\_providers        = (Optional) Allow members to publish and delete providers in the organization's private registry.

Type:

```hcl
object({
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
```

Default: `null`

### <a name="input_sso_team_id"></a> [sso\_team\_id](#input\_sso\_team\_id)

Description: (Optional) Unique Identifier to control team membership via SAML.

Type: `string`

Default: `null`

### <a name="input_visibility"></a> [visibility](#input\_visibility)

Description: (Optional) The visibility of the team (`secret` or `organization`).

Type: `string`

Default: `"organization"`

## Outputs

The following outputs are exported:

### <a name="output_id"></a> [id](#output\_id)

Description: The ID of the team.

### <a name="output_team"></a> [team](#output\_team)

Description: Terraform Cloud team resource
<!-- END_TF_DOCS -->