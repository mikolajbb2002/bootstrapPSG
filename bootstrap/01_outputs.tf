output "bootstrap_kv_id" {
  value       = azurerm_key_vault.main.id
  description = "ID of the bootstrap Key Vault."
}

output "bootstrap_kv_name" {
  value       = azurerm_key_vault.main.name
  description = "Name of the bootstrap Key Vault."
}

output "bootstrap_kv_vault_uri" {
  value       = azurerm_key_vault.main.vault_uri
  description = "Vault URI of the bootstrap Key Vault."
}

output "bootstrap_kv_resource_group_name" {
  value       = azurerm_resource_group.kv.name
  description = "Resource group name where the bootstrap Key Vault is deployed."
}
