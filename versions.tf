# Configure the minimum required providers supported
terraform {

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.48.0"
    }
  }

  cloud {
    organization = "ConseilsTI"

    workspaces {
      name = "terraform_tfe"
    }
  }

  required_version = ">= 1.3.1"

}