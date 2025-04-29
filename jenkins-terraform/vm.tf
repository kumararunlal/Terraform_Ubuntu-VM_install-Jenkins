resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "${var.vm_name}"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_D2s_v3"
  admin_username        = "azureuser"
  #will attach the nic card with vm
  network_interface_ids = [azurerm_network_interface.nic.id]
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    #below mentioned is the path of our ssh public key
    public_key = file("${path.module}/ssh/terraform-azure.pub")
    #it will look for the file in current directory
    #cd ./
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "jenkins-osdisk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  custom_data = filebase64("${path.module}/app/install_jenkins.sh")
  #custom_data = filebase64("cloud-init-config.yaml")
  #custom_data = base64encode(<<-EOF
              #!/bin/bash -ex
             
}
