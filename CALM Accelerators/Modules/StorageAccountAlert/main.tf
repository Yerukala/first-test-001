data "azurerm_resource_group" "rg" {
  name                = var.rg_name
}

data "azurerm_storage_account" "storageaccount" {
  name                = var.storageaccount_name
  resource_group_name = var.rg_name
}

data "azurerm_monitor_action_group" "mag" {
  resource_group_name = var.rg_name
  name                = var.monitor_ag_name
}

# Creates Log Alert on Storage Account
resource "azurerm_monitor_activity_log_alert" "saalert" {
  name                = var.storage_alert_name
  resource_group_name = var.rg_name
  scopes              = [data.azurerm_resource_group.rg.id]
  description         = "This alert will monitor a specific storage account changes."

  criteria {
    resource_id    = data.azurerm_storage_account.storageaccount.id
    operation_name = var.storage_opertaion_name
    category       = var.storage_category
  }
   action {
    action_group_id = data.azurerm_monitor_action_group.mag.id
  }
} 