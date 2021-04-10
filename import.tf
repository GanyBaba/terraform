terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.31.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_virtual_machine" "portalVM" {
  name                  = "portal-vm"
  location              = "eastasia"
  resource_group_name   = "terraform_resourcegroup"
  network_interface_ids = ["/subscriptions/a8f33c70-4c7f-4db8-af7c-0cd6f8011834/resourceGroups/portal_rg/providers/Microsoft.Network/networkInterfaces/portalinstance740"]
  vm_size               = "Standard_D1_v2"
  storage_os_disk {
    name              = "portalinstance_OsDisk_1_d05e9558b71247f9871c1851e980016b"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }
  tags = {
    environment = "Dev"
  }
}