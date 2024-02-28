data "azurerm_resource_group" "rg" {
  name                = var.rg_name
}

data "azurerm_virtual_machine" "windows_vm" {
  name                = var.windows_vm_name
  resource_group_name = var.rg_name
}  

# Creates Storage Account
resource "azurerm_storage_account" "storageaccount" {
  name                     = var.storage_name
  resource_group_name      = var.rg_name 
  location                 = var.location
  account_tier             = var.storage_tier
  account_replication_type = var.storage_type
  public_network_access_enabled = false
}

# Creates Log Anaylytics Workspace
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.log_analytics_sku
  retention_in_days   = var.log_analytics_retention
}

# Creates Virtual Machine Extention
resource "azurerm_virtual_machine_extension" "vmagent" {
  name                       = var.vm_extension_name01
  virtual_machine_id         = data.azurerm_virtual_machine.windows_vm.id
  publisher                  = var.vm_extension_publisher01
  type                       = var.vm_extension_type01
  type_handler_version       = var.vm_extension_version01
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
      "workspaceId" : "${azurerm_log_analytics_workspace.law.workspace_id}"
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "workspaceKey" : "${azurerm_log_analytics_workspace.law.primary_shared_key}"
    }
  PROTECTED_SETTINGS
  
  depends_on = [
    azurerm_log_analytics_workspace.law
  ]
}

# Creates Virtual Machine Monitor Agent
resource "azurerm_virtual_machine_extension" "guestmetric" {
  name                       = var.vm_extension_name02
  virtual_machine_id         = data.azurerm_virtual_machine.windows_vm.id
  publisher                  = var.vm_extension_publisher02
  type                       = var.vm_extension_type02
  type_handler_version       = var.vm_extension_version02
  auto_upgrade_minor_version = true
  
  depends_on = [
   azurerm_log_analytics_workspace.law
 ]
}

# Creates Log Anaylytics Windows Event
#resource "azurerm_log_analytics_datasource_windows_event" "lawinEvents" {
#  name                = var.la_winevent_name
#  resource_group_name = var.rg_name
#  workspace_name      = var.log_analytics_workspace_name
#  event_log_name      = var.la_winevent_log_name
#  event_types         = ["Information"]

#    depends_on = [
#   azurerm_log_analytics_workspace.law
# ]
#}

# Creates Monitor Action Group
resource "azurerm_monitor_action_group" "mag" {
  name                = var.monitor_ag_name
  resource_group_name = var.rg_name
  short_name          = var.monitor_ag_short_name

  email_receiver {
    name                    = var.monitor_ag_email_name
    email_address           = var.monitor_ag_email_address
    use_common_alert_schema = true
  }
}

# Creates Metric Alert on CPU Usage
resource "azurerm_monitor_metric_alert" "CPUalert" {
  name                = var.monitor_metric_alert_name01
  resource_group_name = var.rg_name
  scopes              = [data.azurerm_virtual_machine.windows_vm.id]
  description         = "The alert will be sent if the CPU percentage exceeds to 50 percent."

  criteria {
    metric_namespace = var.metric_alert_namespace01
    metric_name      = var.metric_alert_name01
    aggregation      = var.metric_alert_aggregation01
    operator         = var.metric_alert_operator01
    threshold        = var.metric_alert_threshold01
  }

  action {
    action_group_id = azurerm_monitor_action_group.mag.id
  }
}

# Creates Metric Alert on Memory Usage
resource "azurerm_monitor_metric_alert" "memoryalert" {
  name                = var.monitor_metric_alert_name02
  resource_group_name = var.rg_name
  scopes              = [data.azurerm_virtual_machine.windows_vm.id]
  description         = "The alert will be sent if the Memory utilization exceeds to 2 percent."

  criteria {
    metric_namespace = var.metric_alert_namespace02
    metric_name      = var.metric_alert_name02
    aggregation      = var.metric_alert_aggregation02
    operator         = var.metric_alert_operator02
    threshold        = var.metric_alert_threshold02
  }  

  action {
    action_group_id = azurerm_monitor_action_group.mag.id
  }
}

# Creates Metric Alert on Disk Usage
resource "azurerm_monitor_metric_alert" "diskalert" {
  name                = var.monitor_metric_alert_name03
  resource_group_name = var.rg_name
  scopes              = [data.azurerm_virtual_machine.windows_vm.id]
  description         = "The alert will be sent if the Disk Write Bytes usage exceeds to 5GB."

  criteria {
    metric_namespace = var.metric_alert_namespace03
    metric_name      = var.metric_alert_name03
    aggregation      = var.metric_alert_aggregation03
    operator         = var.metric_alert_operator03
    threshold        = var.metric_alert_threshold03
  }

  action {
    action_group_id = azurerm_monitor_action_group.mag.id
  }

   depends_on = [
    azurerm_monitor_action_group.mag,
    data.azurerm_virtual_machine.windows_vm
  ]
}
  