#Creates Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

#Creates Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  depends_on = [
    azurerm_resource_group.rg
  ]
}

#Creates Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.snet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.snet_address_prefix
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

#Creates Network Interface Card
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
  depends_on = [
    azurerm_subnet.subnet
  ]
}

#Creates Windows Virtual Machine
resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

   os_disk {
    caching              = var.os_caching
    storage_account_type = var.os_storage_type
  }

  source_image_reference {
    publisher = var.source_image_publish
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = var.source_image_version
  }
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "vm_auto_shutdown" {
  virtual_machine_id = azurerm_windows_virtual_machine.windows_vm.id
  location           = azurerm_resource_group.rg.location
  enabled            = true

  daily_recurrence_time = "2000"
  timezone              = "India Standard Time"

  notification_settings {
    enabled         = true
    time_in_minutes = var.auto_shutdown_notifi_time
    email           = var.auto_shutdown_notifi_email
  }
}

