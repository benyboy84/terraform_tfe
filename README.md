<!-- BEGIN_TF_DOCS -->


## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (> 1.3.1)

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (0.48.0)

## Modules

The following Modules are called:

### <a name="module_modules"></a> [modules](#module\_modules)

Source: ./modules/module

Version:

### <a name="module_teams"></a> [teams](#module\_teams)

Source: ./modules/team

Version:

### <a name="module_workspaces"></a> [workspaces](#module\_workspaces)

Source: ./modules/workspace

Version:

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Resources

The following resources are used by this module:

- [tfe_project.project](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/project) (resource)
- [tfe_oauth_client.client](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/oauth_client) (data source)
- [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/organization) (data source)

## Outputs

The following outputs are exported:

### <a name="output_test"></a> [test](#output\_test)

Description: n/a

<!-- markdownlint-enable -->

<!-- END_TF_DOCS -->