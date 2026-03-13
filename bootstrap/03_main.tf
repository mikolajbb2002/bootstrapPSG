resource "azurerm_resource_group" "fcbresourcegroup" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  location                 = azurerm_resource_group.fcbresourcegroup.location
  resource_group_name      = azurerm_resource_group.fcbresourcegroup.name
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_replication_type
}

resource "azurerm_storage_container" "governance" {
  storage_account_id    = azurerm_storage_account.storage.id
  name                  = var.governance_storage_container_name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_container" "connectivity" {
  storage_account_id    = azurerm_storage_account.storage.id
  name                  = var.connectivity_storage_container_name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_container" "management" {
  storage_account_id    = azurerm_storage_account.storage.id
  name                  = var.management_storage_container_name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_container" "workloads" {
  storage_account_id    = azurerm_storage_account.storage.id
  name                  = var.workloads_storage_container_name
  container_access_type = var.storage_container_access_type
}
