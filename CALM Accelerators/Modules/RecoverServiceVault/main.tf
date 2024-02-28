data "azurerm_virtual_machine" "windows_vm" {
  name                = var.windows_vm_name
  resource_group_name = var.rg_name
}

#Creates Recovery Service Vault
resource "azurerm_recovery_services_vault" "RSV" {
  name                = var.rsv_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.rsv_sku
  #soft_delete_enabled = true
}

#Creates VM BackUp Policy
resource "azurerm_backup_policy_vm" "policy_backup" {
  name                = var.rsv_policy_name
  resource_group_name = var.rg_name
  recovery_vault_name = var.rsv_name

  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "22:00"
  }

  retention_daily {
    count = 30
  }

  retention_weekly {
    count    = 4
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }

  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }
}

#Creates BackUp protection for the VM
resource "azurerm_backup_protected_vm" "protected_vm" {
  resource_group_name = var.rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = data.azurerm_virtual_machine.windows_vm.id
  backup_policy_id    = azurerm_backup_policy_vm.policy_backup.id
}