locals {

  # The following locals use logic to determine the project associate with each team.
  project_teams_array = flatten([for projects, project in local.projects :
    flatten([for teams, team in project.teams :
      merge(
        team,
        { name           = "${lower(replace(projects, "/\\W|_|\\s/", "_"))}_${lower(teams)}"
          project        = projects
          project_access = lower(team.project_access)
        }
      )
    ])
    if try(project.teams, null) != null
  ])
  project_teams = { for row in local.project_teams_array : row.name => row }

  # This is to merge organization teams with project teams.
  teams = merge(local.organization_teams, local.project_teams)

}