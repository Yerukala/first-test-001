variable "rg_name" {
  description = "The name of the resource group in which the resources will be created"
  type = string
}
variable "storageaccount_name" {
  description = "Name of the storage account"
  type = string
}
variable "monitor_ag_name" {
  description = "Name of the Monitor Action Group"
  type = string  
}
variable "storage_alert_name" {
  description = "The name of the activity log alert"
  type = string  
}
variable "storage_opertaion_name" {
  description = "The name of the operation"
  type = string  
}
variable "storage_category" {
  description = "The name of the category"
  type = string  
}