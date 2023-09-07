locals {

  # Each project will receive some default permission sets.
  # For each permission sets, a team will be created and assign to the project.
  default_permission_sets = ["read", "write", "maintain", "admin"]

  # The following locals use logic to determine the project associate with each default permission sets team. 
  default_project_teams_array = flatten([for projects, project in local.projects :
    flatten([for key, row in local.default_permission_sets :
      {
        name    = "${lower(replace(projects, "/\\W|_|\\s/", "_"))}_${lower(row)}"
        project = projects
        access  = lower(row)
      }
    ])
  ])
  default_project_teams = { for row in local.default_project_teams_array : row.name => row }

  # The following locals use logic to determine the project associate with each custom team.
  custon_project_teams_array = flatten([for projects, project in local.projects :
    flatten([for teams, team in project.teams :
      merge(
        team,
        { name    = teams
          project = projects
        }
      )
    ])
    if try(project.teams, null) != null
  ])
  custom_project_teams = { for row in local.custon_project_teams_array : row.name => row }

  # This is to merge default permission sets team with custom one.
  project_teams = merge(local.default_project_teams, local.custom_project_teams)

}