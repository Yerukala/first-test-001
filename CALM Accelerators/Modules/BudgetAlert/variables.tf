variable "subscription_name" {
    description = "Name of the Subscription ID"
    type = string  
}
variable "rg_name" {
    description = "The name of the resource group in which the resources will be created"
    type = string  
}
variable "monitor_ag_name" {
    description = "The name of the Action Group can be sourced from the azurerm_monitor_action_group resource"
    type = string  
}
variable "consumption_budget_name" {
    description = "Specifies budget consumption name"
    type = string  
}
variable "contact_emails" {
    description = "The name of the preferend email ID"
    type = list (string)  
}