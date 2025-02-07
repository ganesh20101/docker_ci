provider "azurerm" {
  features {}
  subscription_id = "b9ea94d3-dead-4d9e-8518-d98efaae82bb"
}

# ✅ Use Existing Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "aks-resource-group"
  location = "West US 3"
}

# ✅ Reference Existing Virtual Network
data "azurerm_virtual_network" "vnet" {
  name                = "aks-vnet1"  # Existing VNet
  resource_group_name = azurerm_resource_group.rg.name
}

# ✅ Create Subnet inside the Existing VNet
resource "azurerm_subnet" "subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# ✅ Create AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-demo"

  default_node_pool {
    name           = "default"
    node_count     = 2
    vm_size        = "Standard_D2als_v6"
    vnet_subnet_id = azurerm_subnet.subnet.id
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.2.0.0/16"
    dns_service_ip = "10.2.0.10"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }

  depends_on = [azurerm_subnet.subnet]  # No need to depend on VNet as it's pre-existing
}

# ✅ Output Kubernetes Configuration
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
