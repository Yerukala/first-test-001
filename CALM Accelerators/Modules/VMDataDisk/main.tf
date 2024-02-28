data "azurerm_resource_group" "rg" {
  name                = var.rg_name
}

data "azurerm_virtual_machine" "windows_vm" {
  name                = var.windows_vm_name
  resource_group_name = var.rg_name
}

data "azurerm_monitor_action_group" "mag" {
  resource_group_name = var.rg_name
  name                = var.monitor_ag_name
}

# Creates Managed Disk
resource "azurerm_managed_disk" "managed_disk" {
  name                 = "${var.windows_vm_name}-disk1"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.md_storage_type
  create_option        = var.md_option
  disk_size_gb         = var.md_disk_size
}

# Creates Data Disk and attaches to the VM
resource "azurerm_virtual_machine_data_disk_attachment" "datadisck" {
  managed_disk_id    = azurerm_managed_disk.managed_disk.id
  virtual_machine_id = data.azurerm_virtual_machine.windows_vm.id
  lun                = var.data_disk_lu
  caching            = var.data_disk_caching
}

# Creates Metric Alert on Disk IOPS
resource "azurerm_monitor_metric_alert" "operationalert" {
  name                = var.monitor_metric_alert_name
  resource_group_name = var.rg_name
  scopes              = [data.azurerm_virtual_machine.windows_vm.id]
  description         = "The alert will be sent if the Disk Write IOPS usage exceeds to 10 percent."

  criteria {
    metric_namespace = var.metric_alert_namespace
    metric_name      = var.metric_alert_name
    aggregation      = var.metric_alert_aggregation
    operator         = var.metric_alert_operator
    threshold        = var.metric_alert_threshold
  }

  action {
    action_group_id = data.azurerm_monitor_action_group.mag.id
  }
}  