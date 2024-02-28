variable "rg_name" {
  description = "The name of the resource group in which the resources will be created"
  type = string
}
variable "location" {
  description = "The region where the new resource will be created"
  type = string
}
variable "storageaccount_name" {
  description = "Name of the storage account"
  type = string
}
variable "nsg_name" {
  description = "Network security group name"
  type = string
}
variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type = string
}
variable "network_watcher_name" {
  description = "Name of the azurerm_network_watcher"
  type = string  
}
variable "network_watcher_log_name" {
  description = "Name of the azurerm_network_watcher_flow_log"
  type = string  
}