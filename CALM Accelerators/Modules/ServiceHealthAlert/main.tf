data "azurerm_resource_group" "rg" {
  name                = var.rg_name
}

data "azurerm_monitor_action_group" "mag" {
  resource_group_name = var.rg_name
  name                = var.monitor_ag_name
}

resource "azurerm_monitor_activity_log_alert" "main" {
  name                = var.monitor_activity_log_alert
  resource_group_name = var.rg_name
  scopes              = [data.azurerm_resource_group.rg.id]
  enabled             = var.monitor_activity_log_alert_enabled
  description         = var.monitor_activity_log_alert_description

  criteria {
    category = var.criteria_category

    service_health {
      events    = var.service_health_events
      locations = var.service_health_locations
      services  = var.service_health_services
    }
  }

    action {
    action_group_id = data.azurerm_monitor_action_group.mag.id
  }
}  