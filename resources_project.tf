# The following resource block is used to create project resources.

resource "tfe_project" "project" {
  for_each = local.projects

  organization = data.tfe_organization.conseilsti.name
  name         = each.key
}
