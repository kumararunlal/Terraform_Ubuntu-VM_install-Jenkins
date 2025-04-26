resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm_name}public-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}