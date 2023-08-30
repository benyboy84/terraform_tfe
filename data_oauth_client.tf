data "tfe_oauth_client" "client" {
  organization = data.tfe_organization.this.name
  name         = "GitHub.com"
}