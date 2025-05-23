variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada Central"
}
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

#variable "vm_size" {
#  description = "Size of the virtual machine"
#  type        = string
#  default     = "Standard_D2s_v3"
#}

#variable "admin_username" {
#  description = "Admin username for the VM"
#  type        = string
#}

#variable "admin_password" {
#  description = "Admin password for the VM"
#  type        = string
#  sensitive   = true
#}