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

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.snet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

# Create Network Security Group to Access the Windows VM from Internet
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name

# We are creating a rule to allow traffic on port 3389
  security_rule {
    name                       = var.nsg_rule_name
    priority                   = var.nsg_rule_priority
    direction                  = var.nsg_rule_direction
    access                     = var.nsg_rule_access
    protocol                   = var.nsg_rule_protocol
    source_port_range          = var.nsg_rule_source_port
    destination_port_range     = var.nsg_rule_destinaton_port
    source_address_prefix      = var.nsg_rule_source_address
    destination_address_prefix = var.nsg_rule_destinaton_address
  }
}

# Associate the NSG with the Subnet
resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = data.azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
  depends_on = [
    azurerm_network_security_group.nsg
  ]
}

# Creates Log Alert on Network Security Group
resource "azurerm_monitor_activity_log_alert" "alasecuritygroup" {
  name                     = var.monitor_activity_log_alert_name
  resource_group_name      = var.rg_name
  scopes                   = [data.azurerm_subscription.subscription.id]
  description              = "Monitoring for Create or Update Network Security Group events to detect suspicious activity"

  criteria {
    resource_id    = azurerm_network_security_group.nsg.id
    category       = var.monitor_activity_log_alert_category
    operation_name = var.monitor_activity_log_alert_operation 
  }
  action {
    action_group_id = data.azurerm_monitor_action_group.mag.id
  }

}