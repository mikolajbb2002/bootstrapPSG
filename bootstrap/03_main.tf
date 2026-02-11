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

resource "azurerm_storage_container" "core" {
  storage_account_id  = azurerm_storage_account.storage.id
  name                  = var.core_storage_container_name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_container" "runners" {
  storage_account_id  = azurerm_storage_account.storage.id
  name                  = var.runners_storage_container_name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_container" "platformlz" {
  storage_account_id  = azurerm_storage_account.storage.id
  name                  = var.platformlz_storage_container_name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_container" "applz" {
  storage_account_id  = azurerm_storage_account.storage.id
  name                  = var.applz_storage_container_name
  container_access_type = var.storage_container_access_type
}
