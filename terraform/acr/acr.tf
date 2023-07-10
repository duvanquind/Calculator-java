provider "azurerm" {
  subscription_id            = "#{spSubscriptionId}#"
  client_id                  = "#{spId}#"
  client_secret              = "#{spPassword}#"
  tenant_id                  = "#{spTenantId}#"
  skip_provider_registration = true
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.21.0"
    }
  }
  # Blob storage account. Authenticating using service principal
  backend "azurerm" {
    resource_group_name  = "#{resourceGroup}#"
    storage_account_name = "#{storageAccountName}#"
    container_name       = "#{storageContainerNameAcr}#"
    key                  = "#{storageKey}#"
  }
}

# Resource container registry
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}
