variable "subscription_name" {
  description = "ID of the Subscription"
  type = string  
}
variable "rg_name" {
  description = "The name of the resource group in which the resources will be created"
  type = string
}
variable "monitor_ag_name" {
  description = "Name of the Monitor Action Group"
  type = string  
}
variable "snet_name" {
  description = "Specifies the name of the Subnet"
  type = string
}
variable "vnet_name" {
  description = "Specifies the name of the Vnet"
  type = string
}
variable "rt_name" {
  description = "Specifies the name of the RouteTable"
  type = string
}
variable "location" {
  description = "The region where the new resource will be created"
  type = string
}
variable "route_name" {
  description = "Specifies the name of the Route"
  type = string
}
variable "route_prefix" {
  description = "The destination CIDR to which the route applies, such as `10.1.0.0/16"
  type = string
}
variable "route_hop_type" {
  description = "The type of Azure hop the packet should be sent to. Possible values are: `VirtualNetworkGateway`, `VnetLocal`, `Internet"
  type = string
}
variable "monitor_activity_log_alert_name" {
  description = "The name of the activity log alert"
  type = string  
}
variable "monitor_activity_log_alert_category" {
  description = "The name of the category"
  type = string  
}
variable "monitor_activity_log_alert_operation" {
  description = "The name of the operation"
  type = string  
}