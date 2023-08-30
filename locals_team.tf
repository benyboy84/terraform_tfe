# The following locals use logic to determine the project associate with each workspace.

locals {
  project_teams_array = flatten([for projects, project in local.projects :
    flatten([for teams, team in project.teams :
      merge(
        workspace,
        { name = teams
        project = projects }
      )
    ])
    if try(project.teams, null) != null
  ])
  project_teams = { for row in local.project_teams_array : row.name => row }
}