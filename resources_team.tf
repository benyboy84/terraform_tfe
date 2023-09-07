# The following resource block is used to create team resources.

module "teams" {
  source = "./modules/team"

  for_each = local.teams

  name         = each.key
  organization = data.tfe_organization.this.name

  visibility          = try(each.value.visibility, null)
  sso_team_id         = try(each.value.sso_team_id, null)
  organization_access = try(each.value.organization_access, null)

}

module "project_teams" {
  source = "./modules/team"

  for_each = local.project_teams

  name         = each.key
  organization = data.tfe_organization.this.name
  project_id   = tfe_project.project["${each.value.project}"].id

}
