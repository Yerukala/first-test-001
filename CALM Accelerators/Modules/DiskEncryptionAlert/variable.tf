variable "rg_name" {
  type = string
}
variable "monitor_ag_name" {
  description = "Name of the Monitor Action Group"
  type = string  
}
variable "key_vault_name" {
  type = string
}
variable "key_vault_sku_name" {
  type = string
}
variable "key_vault_key_name" {
  type = string
}
variable "disk_encry_name" {
  type = string
}
variable "monitor_activity_alert_name" {
  type = string
}
variable "activity_alert_category" {
  type = string
}
variable "activity_alert_operation" {
  type = string
}