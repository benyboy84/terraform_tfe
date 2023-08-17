data "tfe_organization" "ConseilsTI" {
  name = "ConseilsTI"
}


resource "tfe_project" "test" {
  organization = data.tfe_organization.ConseilsTI.name
  name = "projectname"
}