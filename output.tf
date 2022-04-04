output "azurerm_resorce_group_name" {
  value = "${azurerm_resource_group.vydnd-rg.name}"
}

output "azurerm_key_vault_name" {
  value = "${azurerm_key_vault.vydnd-kv.name}"
}