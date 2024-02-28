data "azurerm_subscription" "subscription" {
  subscription_id = var.subscription_name
}

data "azurerm_resource_group" "rg"{
  name            = var.rg_name
}

data "azurerm_virtual_machine" "windows_vm" {
  name                = var.windows_vm_name
  resource_group_name = var.rg_name
}

data "azurerm_monitor_action_group" "mag" {
  resource_group_name = var.rg_name
  name                = var.monitor_ag_name
}

# Creates Activity Log Alert on VM Resource Health
resource "azurerm_monitor_activity_log_alert" "resoucehealth" {
  name                     = var.monitor_activity_log_alert_name
  resource_group_name      = var.rg_name
  scopes                   = [data.azurerm_subscription.subscription.id]
  description              = "This activity log alert is to monitor the health of the Virtual Machine"

  criteria {
    resource_id    = data.azurerm_virtual_machine.windows_vm.id
    category       = var.monitor_activity_log_alert_category
    operation_name = var.monitor_activity_log_alert_operation 
  }
  action {
    action_group_id = data.azurerm_monitor_action_group.mag.id
  }

}