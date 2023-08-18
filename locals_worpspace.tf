# The following locals use logic to determine the project associate with each workspace.

locals {
  workspaces_array = flatten([for projects, project in local.projects :
    flatten([for workspaces, workspace in project.workspaces :
      merge(
        workspace,
        { project = projects }
      )
    ])
  ])
  workspaces = { for row in local.workspaces_array : row.name => row }
}