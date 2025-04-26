terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "tf-cd"
    storage_account_name = "gitauto"
    container_name       = "terraformbackend"
    key                  = "terrajenkins.tfstate"
    #use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  #use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
