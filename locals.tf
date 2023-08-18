# The following block of locals are used to customize the Hashicorp Terraform Cloud.
locals {
  # The organization name
  organization_name = "ConseilsTI"

  # The project and workspace structure.
  projects = {
    "Azure Landing Zone" = {
      workspaces = {
        "azure-tf-enterprise" = {
          name                  = "azure-tf-enterprise"
          execution_mode        = "local"
          file_triggers_enabled = false
          queue_all_runs        = false
        }
      }
    }
    "Terraform Cloud" = {
      workspaces = {}
    }
  }
}

