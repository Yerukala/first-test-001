variable "rg_name" {
    description = "The name of the resource group in which the resources will be created"
    type = string
}
variable "location"{
    description = "The region where the new resource will be created"
    type = string
}
variable "vnet_name" {
    description = "Specifies the name of the Virtual Network"
    type = string
}
variable "snet_name" {
    description = "Specifies the name of the Subnet"
    type = string
}
variable "vm_name" {
    description = "Windows Virtual Machine Name - Max 15 characters"
    type = string
}
variable "vnet_address_space" {
    description = "The address space used by the virtual network"
    type = list (string)
    #default = ["10.5.0.0/16"]
}
variable "snet_address_prefix" {
    description = "The address prefix to use for the subnet"
    type = list (string)
    #default = ["10.5.1.0/24"]
}
variable "private_ip_address_allocation" {
    description = "The Static IP Address which should be used"
    type = string
    #default = ["dynamic"]
}
variable "size" {
    description = "Specifies the size of the Virtual Machine. Eg: Standard_B1s"
    type = string
    #default = ["Standard_B1s"]
}
variable "admin_username" {
    description = "The username to assign to the new VMs admin user account"
    type = string
}
variable "admin_password" {
    description = "The password to assign to the new Admin user account"
    type = string
}
variable "os_caching" {
    description = "Type of caching to use on the OS disk - Options: None, ReadOnly or ReadWrite"
    type = string
}
variable "os_storage_type" {
    description = "Type of storage account to use with the OS disk - Options: Standard_LRS, StandardSSD_LRS or Premium_LRS"
    type = string
}
variable "source_image_publish" {
    description = "Operating System Publisher"
    type = string
}
variable "source_image_offer" {
    description = "Operating System Name"
    type = string
}
variable "source_image_sku" {
    description = "Operating System SKU"
    type = string
}
variable "source_image_version" {
    description = "Operating System Version"
    type = string
}
variable "auto_shutdown_notifi_time" {
    description = "value"
    type = string
}
variable "auto_shutdown_notifi_email" {
    description = "value"
    type = string
}