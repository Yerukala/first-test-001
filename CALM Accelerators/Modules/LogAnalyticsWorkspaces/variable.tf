variable "rg_name" {
    description = "Name of the resource group where to locate the storage account"
    type = string
}
variable "location" {
    description = "Loaction of the Storage Account"
    type = string
}
variable "windows_vm_name" {
    description = "Name of the Windows Virtual Machine"
    type = string
}
variable "storage_name" {
    description = "Name of the Storage Account"
    type = string
}
variable "storage_tier" {
    description = "The Storage Tier for the new Account. Options are 'Standard' or 'Premium'"
    type = string
}
variable "storage_type" {
    description = "The replication type required for the new Storage Account. Options are LRS; GRS; RAGRS; ZRS"
    type = string
}
variable "log_analytics_workspace_name" {
    description = "Name of the Log Analytics Workspace"
    type = string
}
variable "log_analytics_sku" {
    description = "Specified the Sku of the Log Analytics Workspace"
    type = string
}
variable "log_analytics_retention" {
    description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730"
    type = string
}
variable "vm_extension_name01" {
    description = "The name of the Extention"
    type = string
}
variable "vm_extension_publisher01" {
    description = "Specifies the extension publisher"
    type = string
}
variable "vm_extension_type01" {
    description = "Specifies the extention type"
    type = string
}
variable "vm_extension_version01" {
    description = "Specifies the extention version"
    type = string
}
variable "vm_extension_name02" {
    description = "The name of the Extention"
    type = string
}
variable "vm_extension_publisher02" {
    description = "Specifies the extension publisher"
    type = string
}
variable "vm_extension_type02" {
    description = "Specifies the extention type"
    type = string
}
variable "vm_extension_version02" {
    description = "Specifies the extention version"
    type = string
}
variable "la_winevent_name" {
    description = "The name of the LogAnalytics windowsevent name"
    type = string
}
variable "la_winevent_log_name" {
    description = "The name of the Log analytics windows event"
    type = string
}
variable "monitor_ag_name" {
    description = "The name of the Action Group"
    type = string
}
variable "monitor_ag_short_name" {
    description = "The short name of the action group. This will be used in SMS messages"
    type = string
}
variable "monitor_ag_email_name" {
    description = "List of email receivers"
    type = string
}
variable "monitor_ag_email_address" {
    description = "List of email receivers"
    type = string
}
variable "monitor_metric_alert_name01" {
    description = "The name of the Monitor Metric Alert"
    type = string
}
variable "metric_alert_namespace01" {
    description = "The name of the metric alert name space"
    type = string
}
variable "metric_alert_name01" {
    description = "The name of the Metric Alert"
    type = string
}
variable "metric_alert_aggregation01" {
    type = string
}
variable "metric_alert_operator01" {
    description = "The name of the operation"
    type = string
}
variable "metric_alert_threshold01" {
    type = string
}
variable "monitor_metric_alert_name02" {
    description = "The name of the Monitor Metric Alert"
    type = string
}
variable "metric_alert_namespace02" {
    description = "The name of the metric alert name space"
    type = string
}
variable "metric_alert_name02" {
    description = "The name of the Metric Alert"
    type = string
}
variable "metric_alert_aggregation02" {
    type = string
}
variable "metric_alert_operator02" {
    description = "The name of the operation"
    type = string
}
variable "metric_alert_threshold02" {
    type = string
}
variable "monitor_metric_alert_name03" {
    description = "The name of the Monitor Metric Alert"
    type = string
}
variable "metric_alert_namespace03" {
    description = "The name of the metric alert name space"
    type = string
}
variable "metric_alert_name03" {
    description = "The name of the Metric Alert"
    type = string
}
variable "metric_alert_aggregation03" {
    type = string
}
variable "metric_alert_operator03" {
    description = "The name of the operation"
    type = string
}
variable "metric_alert_threshold03" {
    type = string
}
