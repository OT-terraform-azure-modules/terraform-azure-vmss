resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
}

module "vmss" {
  source                      = "../"
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  vnet_name                   = azurerm_virtual_network.vnet.name
  vnet_address_space          = azurerm_virtual_network.vnet.address_space
  subnet_name                 = azurerm_subnet.subnet.name
  subnet_address_prefixes     = azurerm_subnet.subnet.address_prefixes
  subnet_id                   = azurerm_subnet.subnet.id
  vmss_name                   = var.vmss_name
  vmss_sku                    = var.vmss_sku
  vmss_instances              = var.vmss_instances
  additional_capabilities     = var.additional_capabilities
  additional_unattend_content = var.additional_unattend_content
  automatic_instance_repair   = var.automatic_instance_repair
  automatic_os_upgrade_policy = var.automatic_os_upgrade_policy
  boot_diagnostics            = var.boot_diagnostics
  extension                   = var.extension
  identity                    = var.identity
  plan                        = var.plan
  data_disk                   = var.data_disk
  rolling_upgrade_policy      = var.rolling_upgrade_policy
  secret                      = var.secret
  certificate                 = var.certificate
  termination_notification    = var.termination_notification
  vmss_tags                   = var.vmss_tags
  winrm_listener              = var.winrm_listener
  diff_disk_settings          = var.diff_disk_settings
  ip_tag                      = var.ip_tag
  os_disk                     = var.os_disk
  public_key                  = file("~/.ssh/id_rsa.pub")
  network_interface           = var.network_interface
  ip_configuration            = var.ip_configuration
  vmss_admin_password         = var.vmss_admin_password
  vmss_admin_username         = var.vmss_admin_username
  vmss_computer_name_prefix   = var.vmss_computer_name_prefix
  source_image_reference      = var.source_image_reference
  os_flavor                   = var.os_flavor
}