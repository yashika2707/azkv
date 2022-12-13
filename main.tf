
resource "azurerm_resource_group" "vydnd-rg" {
  name     = "VYDND-RG-Terra1"
  location = "East US"
}

data "azurerm_client_config" "current" {

}

resource "azurerm_key_vault" "vydnd-kv" {
  name                       = var.vydnd-kv
  location                   = azurerm_resource_group.vydnd-rg.location
  resource_group_name        = azurerm_resource_group.vydnd-rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  # soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get"
    ]

    secret_permissions = [
      "List",
      "Set",
      "Get",
      "Recover",
      "Delete"
      
    ]
  }

  tags = { 
    environment = "Development"
    }
}



resource "azurerm_key_vault_secret" "example" {
  count        = length(var.secret_maps)
  name         = keys(var.secret_maps)[count.index]
  value        = values(var.secret_maps)[count.index]
  key_vault_id = azurerm_key_vault.vydnd-kv.id
}

# resource "azuredevops_variable_group" "variablegroup" {
#   project_id   = azuredevops_project.tf-example.id
#   name         = "myvariable"
#   description  = "This variable group is created using Terraform"
#   allow_access = true

  # variable {
  #   name  = "buildPlatform"
  #   value = "Any CPU"
  # }

  # variable {
  #   name      = "buildConfiguration"
  #   value     = "Release"
  # }
#}