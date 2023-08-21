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
          tag_names             = ["managed_by_terraform"]
        }
        "azure-tf-application-finance" = {
          name                  = "azure-tf-application-finance"
          tag_names             = ["managed_by_terraform"]
          vcs_repo = {
            identifier                 = "benyboy84/azure-tf-application-finance"
            oauth_token_id             = data.tfe_oauth_client.client.oauth_token_id 
          }
        }
      }
    }
    "Terraform Cloud" = {
      workspaces = {}
    }
  }
}
