variable "rg_name" {
    description = "The name of the resource group in which the resources will be created"
    type = string
}
variable "windows_vm_name" {
    description = "Windows Virtual Machine name"
    type = string
}
variable "location" {
    description = "The region where the new resource will be created"
    type = string
}
variable "monitor_ag_name" {
    description = "Defines the name of the Monitor Action Group"
  type = string  
}
variable "md_storage_type" {
    description = "Specifies the type of OS Managed Disk which should be created. Possible values are Standard_LRS or Premium_LRS"
    type = string
}
variable "md_option" {
    description = "Specifies Managed Disk option to 'empty'"
    type = string
}
variable "md_disk_size" {
    description = "Specify the size in GB of the data disk"
    type = string
}
variable "data_disk_lu" {
    description = ""
    type = string
}
variable "data_disk_caching" {
    description = "Type of caching to use on the data disk - Options: None, ReadOnly or ReadWrite"
    type = string
}
variable "monitor_metric_alert_name" {
    type = string
}
variable "metric_alert_namespace" {
    type = string
}
variable "metric_alert_name" {
    type = string
}
variable "metric_alert_aggregation" {
    type = string
}
variable "metric_alert_operator" {
    type = string
}
variable "metric_alert_threshold" {
    type = string
}