# TFC variables Terraform module

Terraform variables module which manages configuration and life-cycle 
of all your Terraform Cloud variables. It is designed to be used from 
a dedicated Terraform Cloud workspace that would provision and manage 
rest of your teams using Terraform code (IaC).

## Permissions

To manage the team resources, provide a user token from an account with 
appropriate permissions. This user should belong to the `owners` team. 
Alternatively, you can use a token from the owners team instead of a user token.

## Authentication

The Terraform Cloud provider requires a Terraform Cloud/Enterprise API token in 
order to manage resources.

There are several ways to provide the required token:

- Set the `token` argument in the provider configuration. You can set the token argument in the provider configuration. Use an
input variable for the token.
- Set the `TFE_TOKEN` environment variable: The provider can read the TFE_TOKEN environment variable and the token stored there
to authenticate.

## Features

- Create variables.
- Create variable set.
- Associate a variable set to a project.
- Associate a varrable set to a workspace.

## Usage example
```hcl
module "team" {
  source = "./modules/variable"

  name           = "Team Name"
  organization   = "Organization Name"
  members        = ["user@company.com"]
  project_id     = "Project_Id"
  project_access = "write"
  token          = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (0.48.0)

## Providers

The following providers are used by this module:

- <a name="provider_tfe"></a> [tfe](#provider\_tfe) (0.48.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [tfe_project_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/project_variable_set) (resource)
- [tfe_variable.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/variable) (resource)
- [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/variable_set) (resource)
- [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/workspace_variable_set) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_category"></a> [category](#input\_category)

Description: (Required) Whether this is a Terraform or environment variable. Valid values are `terraform` or `env`.

Type: `string`

### <a name="input_key"></a> [key](#input\_key)

Description: (Required) Name of the variable.

Type: `string`

### <a name="input_project_id"></a> [project\_id](#input\_project\_id)

Description: (Optional) Project ID to add the variable set to.

Type: `string`

### <a name="input_value"></a> [value](#input\_value)

Description: (Required) Value of the variable.

Type: `string`

### <a name="input_variable_set_id"></a> [variable\_set\_id](#input\_variable\_set\_id)

Description: (Optional) Name of the variable set to add.

Type: `string`

### <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id)

Description: (Optional) Workspace ID to add the variable set to.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_global"></a> [global](#input\_global)

Description: (Optional) Whether or not the variable set applies to all workspaces in the organization.

Type: `bool`

Default: `false`

### <a name="input_hcl"></a> [hcl](#input\_hcl)

Description: (Optional) Whether to evaluate the value of the variable as a string of HCL code. Has no effect for environment variables.

Type: `bool`

Default: `false`

### <a name="input_organization"></a> [organization](#input\_organization)

Description: (Optional) Name of the organization. If omitted, organization must be defined in the provider config.

Type: `string`

Default: `null`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: (Optional) Project name to add the variable set to.

Type: `string`

Default: `null`

### <a name="input_sensitive"></a> [sensitive](#input\_sensitive)

Description: (Optional) Whether the value is sensitive. If true then the variable is written once and not visible thereafter.

Type: `bool`

Default: `false`

### <a name="input_variable_description"></a> [variable\_description](#input\_variable\_description)

Description: (Optional) Description of the variable.

Type: `string`

Default: `null`

### <a name="input_variable_set_description"></a> [variable\_set\_description](#input\_variable\_set\_description)

Description: (Optional) Description of the variable set.

Type: `string`

Default: `null`

### <a name="input_variable_set_name"></a> [variable\_set\_name](#input\_variable\_set\_name)

Description: (Optional) Name of the variable set.

Type: `string`

Default: `null`

### <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name)

Description: (Optional) Workspace name to add the variable set to.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_project_variable_set_attachment"></a> [project\_variable\_set\_attachment](#output\_project\_variable\_set\_attachment)

Description: Terraform Cloud project\_variable\_set resource.

### <a name="output_project_variable_set_attachment_id"></a> [project\_variable\_set\_attachment\_id](#output\_project\_variable\_set\_attachment\_id)

Description: The ID of the variable set attachment. ID format: `<project-id>_<variable-set-id>`

### <a name="output_readable_value"></a> [readable\_value](#output\_readable\_value)

Description: Only present if the variable is non-sensitive. A copy of the value which will not be marked as sensitive in plan outputs.

### <a name="output_variable"></a> [variable](#output\_variable)

Description: Terraform Cloud variable resource.

### <a name="output_variable_id"></a> [variable\_id](#output\_variable\_id)

Description: The ID of the variable.

### <a name="output_variable_set"></a> [variable\_set](#output\_variable\_set)

Description: Terraform Cloud variable\_set resource.

### <a name="output_variable_set_id"></a> [variable\_set\_id](#output\_variable\_set\_id)

Description: The ID of the variable set.

### <a name="output_workspace_variable_set_attachment"></a> [workspace\_variable\_set\_attachment](#output\_workspace\_variable\_set\_attachment)

Description: Terraform Cloud workspace\_variable\_set resource.

### <a name="output_workspace_variable_set_attachment_id"></a> [workspace\_variable\_set\_attachment\_id](#output\_workspace\_variable\_set\_attachment\_id)

Description: The ID of the variable set attachment. ID format: `<workspace-id>_<variable-set-id>`
<!-- END_TF_DOCS -->