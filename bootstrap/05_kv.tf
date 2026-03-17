resource "azurerm_resource_group" "kv" {
  name     = var.kv_rg_name
  location = var.location
}
data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "main" {
  name                        = var.kv_name
  location                    = azurerm_resource_group.kv.location
  resource_group_name         = azurerm_resource_group.kv.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "bootstrap" {
  # var.kv_secrets is marked sensitive, so we only use its (non-sensitive) keys for for_each.
  for_each     = toset(keys(nonsensitive(var.kv_secrets)))
  key_vault_id = azurerm_key_vault.main.id
  name         = each.key
  value        = var.kv_secrets[each.key]
}
