# The following resource block is used to create team resources.

module "teams" {
  source = "./modules/team"

  for_each = local.teams

  name                   = each.key
  organization           = data.tfe_organization.this.name
  visibility             = try(each.value.visibility, "organization")
  sso_team_id            = try(each.value.sso_team_id, null)
  organization_access    = try(each.value.organization_access, null)
  project_id             = try(tfe_project.project["${each.value.project}"].id, null)
  project_access         = try(each.value.project_access, null)
  token                  = try(each.value.token, false)
  token_force_regenerate = try(each.value.token_force_regenerate, null)
  token_expired_at       = try(each.value.token_expired_at, null)
  members                = try(each.value.members, null)

}
