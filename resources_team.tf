# resource "tfe_team" "test" {
#   name         = "test"
#   organization = data.tfe_organization.this.name
#   visibility   = "organization"
# }

resource "tfe_organization_membership" "test" {
  organization = data.tfe_organization.this.name
  email        = "bblais@conseilsti.ca"
}

resource "tfe_organization_membership" "test2" {
  organization = data.tfe_organization.this.name
  email        = "blais_benoit@hotmail.com"
}