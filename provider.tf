##################################################################################
#                         Configure the Azure provider                           #
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }

  }

  required_version = ">= 1.1.0"
  #####################################################################################
  #                       Configure backend state storge                              #
  #####################################################################################
  # backend "azurerm" {
  #   resource_group_name  = "week6"
  #   storage_account_name = "backendstorage2022"
  #   container_name       = "state"
  #   key                  = "prod.terraform.tfstate"
  # }
}
provider "azurerm" {
  features {}
}
