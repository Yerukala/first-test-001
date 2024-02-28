data "azurerm_resource_group" "rg" {
  name                = var.rg_name
}

data "azurerm_storage_account" "storageaccount" {
  name                = var.storageaccount_name
  resource_group_name = var.rg_name
}

data "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = var.rg_name
}

data "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.rg_name
}

resource "azurerm_network_watcher" "network_watcher" {
  name                = var.network_watcher_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_network_watcher_flow_log" "network_logs" {
  network_watcher_name = azurerm_network_watcher.network_watcher.name
  resource_group_name  = data.azurerm_resource_group.rg.name
  name                 = var.network_watcher_log_name

  network_security_group_id = data.azurerm_network_security_group.nsg.id
  storage_account_id        = data.azurerm_storage_account.storageaccount.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 7
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.law.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.law.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.law.id
    interval_in_minutes   = 10
  }
}