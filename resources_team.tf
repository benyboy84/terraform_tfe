# The following resource block is used to create team resources.

module "project_teams_custom" {
  source = "./modules/teams"

  for_each = local.project_teams

  name         = each.key
  organization = data.tfe_organization.this.name
}

module "project_teams_read" {
  source = "./modules/teams"

  for_each = local.projects

  name         = "${replace(each.key, "/\\W|_|\\s/", "_")}_Read"
  organization = data.tfe_organization.this.name
}

module "project_teams_write" {
  source = "./modules/teams"

  for_each = local.projects

  name         = "${replace(each.key, "/\\W|_|\\s/", "_")}_Write"
  organization = data.tfe_organization.this.name
}

module "project_teams_maintain" {
  source = "./modules/teams"

  for_each = local.projects

  name         = "${replace(each.key, "/\\W|_|\\s/", "_")}_Maintain"
  organization = data.tfe_organization.this.name
}

module "project_teams_admin" {
  source = "./modules/teams"

  for_each = local.projects

  name         = "${replace(each.key, "/\\W|_|\\s/", "_")}_Admin"
  organization = data.tfe_organization.this.name
}