data "azurerm_subscription" "subscription" {
  subscription_id = var.subscription_name
}

data "azurerm_resource_group" "rg" {
  name                = var.rg_name
}

data "azurerm_monitor_action_group" "mag" {
  resource_group_name = var.rg_name
  name                = var.monitor_ag_name
}

data "azurerm_subnet" "snet" {
  name                 = var.snet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

# Creates Route Table
resource "azurerm_route_table" "routetable" {
  name                = var.rt_name
  location            = var.location
  resource_group_name = var.rg_name

  route {
    name                   = var.route_name
    address_prefix         = var.route_prefix
    next_hop_type          = var.route_hop_type    
  }
}

# Associates with local Subnet
resource "azurerm_subnet_route_table_association" "snetrt" {
  subnet_id      = data.azurerm_subnet.snet.id
  route_table_id = azurerm_route_table.routetable.id
}

# Creates Log Alert for Route Table
resource "azurerm_monitor_activity_log_alert" "alaroutetable" {
  name                     = var.monitor_activity_log_alert_name
  resource_group_name      = var.rg_name
  scopes                   = [data.azurerm_subscription.subscription.id]
  description              = "Create or Update Route Table events to detect suspicious activity"

  criteria {
    resource_id    = azurerm_route_table.routetable.id
    category       = var.monitor_activity_log_alert_category
    operation_name = var.monitor_activity_log_alert_operation
  }
  action {
    action_group_id = data.azurerm_monitor_action_group.mag.id
  }

}