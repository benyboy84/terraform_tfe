# The following locals use logic to determine the variable_set for workspace.
locals {

  # The following locals use logic to determine the variable_set for workspace at project level.
  workspace_project_variable_set_tuple = flatten([for projects, project in local.projects :
    flatten([for variable_sets, variable_set in project.variable_sets :
      flatten([for workspaces, workspace in toset(variable_set.workspaces) :
        {
          name        = "${lower(replace(variable_sets, "/\\W|_|\\s/", "_"))}_${lower(replace(workspace, "/\\W|_|\\s/", "_"))}"
          description = variable_set.description
          global      = false
          workspace   =  workspace
        }
      ])  
      if try(variable_set.workspaces, null) != null
    ])
    if try(project.variable_sets, null) != null
  ])
  workspace_project_variable_set = { for row in local.workspace_project_variable_set_tuple : row.name => row }

  # The following locals use logic to determine the variable_set for a workspace.
  workspace_variable_set_tuple = flatten([for projects, project in local.projects :
    flatten([for workspaces, workspace in project.workspaces :
      flatten([for variable_sets, variable_set in workspace.variable_sets :
        {
          name        = "${lower(replace(variable_sets, "/\\W|_|\\s/", "_"))}_${lower(replace(workspaces, "/\\W|_|\\s/", "_"))}"
          description = variable_set.description
          global      = false
          workspace   = workspaces
        }
      ])
      if try(workspace.variable_sets, null) != null
    ])
  ])
  workspace_variable_set = { for row in local.workspace_variable_set_tuple : row.name => row }

  # This is to merge all variable_set.
  variable_sets = merge(local.workspace_project_variable_set, local.workspace_variable_set)

}

output "test" {
  value = local.variable_sets
}

# output "variable_sets_array" {
#   value = local.variable_sets
# }



  #   # The following locals use logic to determine the variable in each variable_set for a project.
  #   project_variable_array = flatten([for projects, project in local.projects :
  #     flatten([for variable_sets, variable_set in project.variable_sets :
  #       flatten([for variables, variable in variable_set :
  #         merge(
  #           variable,
  #           { key                       = "${lower(variables)}"
  #             variable_set_name         = "${lower(variable_sets)}"
  #             variable_set_project_name = [projects]
  #           }
  #         )
  #       ])
  #     ])
  #     if try(project.variable_sets, null) != null
  #   ])
  #   project_variables = { for row in local.project_variable_array : row.key => row }

  #   variable_sets = toset(flatten([for variables, variable in local.project_variables : variable.variable_set_name if try(variable.variable_set_name, null) != null]))
