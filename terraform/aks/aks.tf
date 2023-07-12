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
    container_name       = "#{storageContainerNameAks}#"
    key                  = "#{storageKey}#"
  }
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "agentpool"
    node_count = var.agent_count
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }

  tags = {
    Environment = "Development"
  }
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.k8s.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)
}

resource "kubernetes_namespace" "qa-namespace" {
  depends_on = [azurerm_kubernetes_cluster.k8s]
  metadata {
    name = "qa-#{namespace}#"
  }
}

resource "kubernetes_namespace" "pdn-namespace" {
  depends_on = [azurerm_kubernetes_cluster.k8s]
  metadata {
    name = "pdn-#{namespace}#"
  }
}
resource "kubernetes_resource_quota" "qa-resource-quota" {
  metadata {
    name      = "qa-demo-resource-quota"
    namespace = kubernetes_namespace.qa-namespace.metadata[0].name
  }

  spec {
    hard = {
      "limits.cpu"    = "20G" 
      "requests.cpu"  = "10G"  
    }
  }
}
// provider "azurerm" {
//   subscription_id            = "#{spSubscriptionId}#"
//   client_id                  = "#{spId}#"
//   client_secret              = "#{spPassword}#"
//   tenant_id                  = "#{spTenantId}#"
//   skip_provider_registration = true
//   features {}
// }

// terraform {
//   required_providers {
//     azurerm = {
//       source  = "hashicorp/azurerm"
//       version = "~> 2.21.0"
//     }
//   }
//   # Blob storage account. Authenticating using service principal
//   backend "azurerm" {
//     resource_group_name  = "#{resourceGroup}#"
//     storage_account_name = "#{storageAccountName}#"
//     container_name       = "#{storageContainerNameAks}#"
//     key                  = "#{storageKey}#"
//   }
// }

// resource "azurerm_kubernetes_cluster" "k8s" {
//   name                = var.cluster_name
//   location            = var.location
//   resource_group_name = var.resource_group_name
//   dns_prefix          = var.dns_prefix

//   default_node_pool {
//     name       = "agentpool"
//     node_count = var.agent_count
//     vm_size    = "Standard_D2_v2"
//   }

//   service_principal {
//     client_id     = var.client_id
//     client_secret = var.client_secret
//   }

//   network_profile {
//     load_balancer_sku = "Standard"
//     network_plugin    = "kubenet"
//   }

//   tags = {
//     Environment = "Development"
//   }
// }

// provider "kubernetes" {
//   host                   = azurerm_kubernetes_cluster.k8s.kube_config.0.host
//   client_certificate     = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate)
//   client_key             = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_key)
//   cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)
// }

// resource "kubernetes_namespace" "qa-namespace" {
//   depends_on = [azurerm_kubernetes_cluster.k8s]
//   metadata {
//     name = "qa-#{namespace}#"
//   }
// }

// resource "kubernetes_namespace" "pdn-namespace" {
//   depends_on = [azurerm_kubernetes_cluster.k8s]
//   metadata {
//     name = "pdn-#{namespace}#"
//   }
// }