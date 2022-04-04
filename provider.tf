provider "azurerm" {
  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id

features {
  key_vault {
    purge_soft_delete_on_destroy =true
        }
    }
}
