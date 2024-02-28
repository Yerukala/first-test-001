variable "subscription_name" {
  description = "ID of the Subscription"
  type = string  
}
variable "rg_name" {
  description = "The name of the resource group in which the resources will be created"
  type        = string
}
variable "windows_vm_name" {
  description = "Windows Virtual Machine name"
  type        = string
}
variable "monitor_ag_name" {
  type        = string
  description = "The name of the Action Group can be sourced from the azurerm_monitor_action_group resource"
}
variable "monitor_activity_log_alert_name" {
  description = "The name of the activity log alert"
  type        = string  
}
variable "monitor_activity_log_alert_category" {
  description = "The category of the monitor activity log alert"
  type        = string  
}
variable "monitor_activity_log_alert_operation" {
  description = "The Operation for the monitor activity log alert"
  type        = string  
}