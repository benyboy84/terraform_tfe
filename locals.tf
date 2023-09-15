locals {
  # The local is used to define the organization name.
  organization_name = "ConseilsTI"

  # The local aisre used to define teams at the organization level.
  organization_teams = {
    # `organization_teams` is a map of object where the key is the name of the team.
    # Each object must contain an `organization_access` argument with the 
    # team's organization access.
    # Refer to "./modules/team/README.md" for more details on the permissions type.
    "org_admin" = {
      sso_team_id = "a2f4919a-4c3c-436a-a010-fde47b98d0fd"
      token       = true
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
      sso_team_id = "a1f6c183-1350-4298-9266-b1ba00c66372"
      token       = true
      organization_access = {
        manage_modules = true
      }
    },
    "org_membership" = {
      sso_team_id = "88b38c9b-755d-4193-b89a-94cb9c5de56b"
      token       = true
      organization_access = {
        manage_membership = true
      }
    }
    "org_default" = {
      organization_access = {
      }
    }
  }

  # The following local is used to define the projects and workspaces with their required
  # teams and access.
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
      teams = {
        "Read" = {
          project_access = "read"
        }
        "Write" = {
          project_access = "write"
          token          = true
        }
        "Maintain" = {
          project_access = "maintain"
          token          = true
        }
        "Admin" = {
          members        = ["benoit.blais@conseilsti.ca"]
          project_access = "admin"
          token          = true
        }
      }
    }
    "Terraform Cloud" = {
      workspaces = {}
    }
    "Test" = {
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

}
