# Configure the minimum required providers supported
terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.54.0"
    }
  }

  cloud {
    organization = "ConseilsTI"
    workspaces {
      name = "azure-tf-enterprise"
    }
  }

  required_version = ">= 1.3.1"

}