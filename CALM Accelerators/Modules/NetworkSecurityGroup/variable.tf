variable "subscription_name" {
  description = "ID of the Subscription"
  type = string  
}
variable "rg_name" {
  description = "The name of the resource group in which the resources will be created"
  type = string
}
variable "location" {
  description = "The region where the new resource will be created"
  type = string
}
variable "monitor_ag_name" {
  description = "Name of the Monitor Action Group"
  type = string  
}
variable "vnet_name" {
  description = "Specifies the name of the Vnet"
  type = string
}
variable "snet_name" {
  description = "Specifies the name of the Subnet"
  type = string
}
variable "nsg_name" {
  description = "Network security group name"
  type = string
}
variable "nsg_rule_name" {
  description = "A list of objects representing a Network Security Rule"
  type = string
}
variable "nsg_rule_priority" {
  description = "Numeric priority of the rule the value can be between 100 and 4096"
  type = string
}
variable "nsg_rule_direction" {
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are `Inbound` and `Outbound`"
  type = string
}
variable "nsg_rule_access" {
  description = "Specifies whether network traffic is allowed or denied"
  type = string
}
variable "nsg_rule_protocol" {
  description = "Network protocol this rule applies to. Possible values include `Tcp`, `Udp`, `Icmp`, or `*` (which matches all)"
  type = string
}
variable "nsg_rule_source_port" {
  description = "List of source ports or port ranges"
  type = string
}
variable "nsg_rule_destinaton_port" {
  description = "Destination Port or Range. Integer or range between `0` and `65535` or `*` to match any"
  type = string
}
variable "nsg_rule_source_address" {
  description = "List of source address prefixes"
  type = string
}
variable "nsg_rule_destinaton_address" {
  description = "CIDR or destination IP range or `*` to match any IP"
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