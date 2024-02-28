variable "rg_name" {
  description = "The name of the resource group in which the resources will be created"
  type = string
}
variable "monitor_ag_name" {
  description = "Name of the Monitor Action Group"
  type = string  
}

variable "monitor_activity_log_alert" {
  type        = string
  description = "The name of the activity log alert"
}

variable "monitor_activity_log_alert_description" {
  type        = string
  description = "The description of this activity log alert."
}

variable "monitor_activity_log_alert_enabled" {
  type        = string
  description = "Should this Activity Log Alert be enabled? Defaults to true."
}

variable "criteria_category" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth."
}

variable "service_health_events" {
  type        = list(string)
  description = "Events this alert will monitor Possible values are Incident, Maintenance, Informational, ActionRequired and Security. Defaults to all Events"
}

variable "service_health_locations" {
  type        = list(string)
  description = "Locations this alert will monitor. For example, West Europe. Defaults to Global."
}

variable "service_health_services" {
  type        = list(string)
  description = "Services this alert will monitor. For example, Activity Logs & Alerts, Action Groups. Defaults to all Services."
}

