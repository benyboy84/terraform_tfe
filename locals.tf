locals {
  # This local is used to define the organization name.
  organization_name = "ConseilsTI"

  # This local is used to define teams at the organization level.
  organization_teams = {
    # `organization_teams` is a map of object where the key is the name of the team.
    # Each object must contain an `organization_access` argument with the team's organization access.
    # Refer to "./modules/team/README.md" for more details on the permissions type.
    # Here is an example of an object:
    # "team_name" = {
    #   members = []
    #   organization_access = {
    #     read_projects           = true or false
    #     manage_projects         = true or false
    #     read_workspaces         = true or false
    #     manage_workspaces       = true or false
    #     manage_policies         = true or false
    #     manage_policy_overrides = true or false
    #     manage_run_tasks        = true or false
    #     manage_vcs_settings     = true or false
    #     manage_membership       = true or false
    #     manage_modules          = true or false
    #     manage_providers        = true or false
    #   }
    #   sso_team_id            = ""
    #   token                  = true or false
    #   token_expired_at       = ""
    #   token_force_regenerate = true or false
    #   visibility             = "secret" or "organization"
    # }
    # "org_admin" = {
    #   sso_team_id = "a2f4919a-4c3c-436a-a010-fde47b98d0fd"
    #   token       = true
    #   organization_access = {
    #     manage_projects         = true
    #     manage_workspaces       = true
    #     manage_policies         = true
    #     manage_policy_overrides = true
    #     manage_run_tasks        = true
    #     manage_vcs_settings     = true
    #     manage_membership       = true
    #     manage_modules          = true
    #     manage_providers        = true
    #   }
    # },
    # "org_private-registry" = {
    #   sso_team_id = "a1f6c183-1350-4298-9266-b1ba00c66372"
    #   token       = true
    #   organization_access = {
    #     manage_modules = true
    #   }
    # },
    # "org_membership" = {
    #   sso_team_id = "88b38c9b-755d-4193-b89a-94cb9c5de56b"
    #   token       = true
    #   organization_access = {
    #     manage_membership = true
    #   }
    # }
    # "org_default" = {
    #   organization_access = {
    #   }
    # }
  }

  # This local is used to define variable_set at the organization level.
  organization_variable_sets = {

  }

  # This local is used to define the projects and workspaces with their required
  # teams and access.
  # Each project can contain a `workspaces` argument with their properties.
  # Each workspace can contain a `teams` with their workspace access.
  # Each project can contain a `teams` with their project access.
  # Refer to 
  # Refer to 
  # Refer to "./modules/team/README.md" for more details on the team's permissions type.
  # project_name = {
  #   workspaces = {
  #     vcs_repo = {
  #       identifier     = "organization/repository"
  #       oauth_token_id = "token_id"
  #     }
  #     teams = {
  #       "team_name" = {
  #         workspace_access = "access"
  #       }
  #     } 
  #   }
  #   teams = {
  #     "team_name" = {
  #       project_access = "access"
  #     }
  # }
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
          teams = {
            "Write" = {
              workspace_access = "write"
            }
          }
          variables = {

          }
          variable_sets = {
            variable_set_2 = {
              description = "description"
              global      = false
              variables = {
                variable1 = {
                  value     = "value"
                  category  = "env"
                  sensitive = true
                },
                variable2 = {
                  value     = "value"
                  category  = "env"
                  sensitive = true
                },
              }
            }
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
        "Custom" = {
          project_access = "custom"
          custom_workspace_access = {
            runs = "apply"
          }
          token = true
        }
      }
      variable_sets = {
        variable_set_1 = {
          description = "description"
          global      = false
          workspaces = ["azure-tf-enterprise","azure-tf-application-finance"]
          variables = {
            variable1 = {
              value     = "value"
              category  = "env"
              sensitive = true
            },
            variable2 = {
              value     = "value"
              category  = "env"
              sensitive = true
            },
          }
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
