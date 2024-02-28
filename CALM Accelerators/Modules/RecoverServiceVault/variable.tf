variable "windows_vm_name" {
    description = "Windows Virtual Machine Name - Max 15 characters"
    type = string
}
variable "rg_name" {
    description = "The name of the resource group in which the resources will be created"
    type = string
}
variable "rsv_name" {
    description = "Specifies the name of the Recovery Services Vault"
    type = string
}
variable "location" {
    description = "The region where the new resource will be created"
    type = string
}
variable "rsv_sku" {
    description = "Sets the vault's SKU. Possible values include: Standard, RS0"
    type = string
}
variable "rsv_policy_name" {
    description = "Specifies the name of name of the Recovery Services Vault Policy"
    type = string
}
