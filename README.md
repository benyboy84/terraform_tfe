<!-- BEGIN_TF_DOCS -->


## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.3.1)

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (0.48.0)

## Modules

The following Modules are called:

### <a name="module_modules"></a> [modules](#module\_modules)

Source: ./modules/modules

Version:

### <a name="module_workspaces"></a> [workspaces](#module\_workspaces)

Source: ./modules/workspaces

Version:

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Resources

The following resources are used by this module:

- [tfe_organization_membership.test](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/organization_membership) (resource)
- [tfe_organization_membership.test2](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/organization_membership) (resource)
- [tfe_project.project](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/project) (resource)
- [tfe_oauth_client.client](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/oauth_client) (data source)
- [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/organization) (data source)

## Outputs

No outputs.

<!-- markdownlint-enable -->

<!-- END_TF_DOCS -->