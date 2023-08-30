# The following block of locals are used to customize the Hashicorp Terraform Cloud.
locals {
  # The organization name
  organization_name = "ConseilsTI"

  # The project and workspace structure.
  projects = {
    "Azure Landing Zone" = {
      workspaces = {
        "azure-tf-enterprise" = {
          execution_mode        = "local"
          file_triggers_enabled = false
          queue_all_runs        = false
          tag_names             = ["managed_by_terraform"]
        }
        "azure-tf-application-finance" = {
          tag_names = ["managed_by_terraform"]
          vcs_repo = {
            identifier     = "benyboy84/azure-tf-application-finance"
            oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
          }
        }
      }
    }
    "Terraform Cloud" = {
      workspaces = {}
    }
  }

  # A list of all private modules to import into Terraform Cloud private module registry.
  modules = {
    # "terraform-azurerm-key_vault" = {
    #   vcs_repo = {
    #     display_identifier = "benyboy84/terraform-azurerm-key_vault"
    #     identifier         = "benyboy84/terraform-azurerm-key_vault"
    #     oauth_token_id     = data.tfe_oauth_client.client.oauth_token_id
    #   }
    # }
  }

  teams = {
    "org_admin" = {
      organization_access = {
        manage_projects         = true
        manage_workspaces       = true
        manage_policies         = true
        manage_policy_overrides = true
        manage_run_tasks        = true
        manage_vcs_settings     = true
        manage_membership       = true
        manage_modules          = true
        manage_providers        = true
      }
    },
    "org_private-registry" = {
      organization_access = {
        manage_modules          = true
      }
    },
    "org_membership" = {
      organization_access = {
        manage_membership       = true
      }
    }
  }
}
