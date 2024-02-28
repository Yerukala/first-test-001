data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name                = var.rg_name
}

data "azurerm_monitor_action_group" "mag" {
  resource_group_name = var.rg_name
  name                = var.monitor_ag_name
}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = data.azurerm_resource_group.rg.location
  resource_group_name         = data.azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.key_vault_sku_name
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
}

resource "azurerm_key_vault_key" "key_disk_enc_key" {
  name                 = var.key_vault_key_name
  key_vault_id         = azurerm_key_vault.key_vault.id
  key_type             = "RSA"
  key_size             = 2048
  
   key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

resource "azurerm_disk_encryption_set" "disk_encry" {
  name                = var.disk_encry_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  key_vault_key_id    = azurerm_key_vault_key.key_disk_enc_key.id
  
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_key_vault_access_policy" "key_vault_access" {
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Create",
    "Delete",
    "Get",
    "Purge",
    "Recover",
    "Update",
    "List",
    "Decrypt",
    "Sign",
    "GetRotationPolicy",
  ]
}

# Creates Log Alert on Disk Encryption
resource "azurerm_monitor_activity_log_alert" "monitor_activity_alert" {
  name                     = var.monitor_activity_alert_name
  resource_group_name      = var.rg_name
  scopes                   = [data.azurerm_resource_group.rg.id]
  description              = "Delete disk encryption set"

  criteria {
    resource_id    = azurerm_disk_encryption_set.disk_encry.id
    category       = var.activity_alert_category
    operation_name = var.activity_alert_operation 
  }
  action {
    action_group_id = data.azurerm_monitor_action_group.mag.id
  }

}