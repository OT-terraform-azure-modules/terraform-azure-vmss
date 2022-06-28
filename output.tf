output "azurerm_resource_group_id" {
  description = "Id of resource group"
  value       = azurerm_resource_group.rg.id
}

output "azurerm_virtual_network_id" {
  description = "Id of virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "azurerm_subnet_id" {
  description = "Id of subnet"
  value       = azurerm_subnet.subnet.id
}
output "azurerm_windows_virtual_machine_scale_set_id" {
  description = "Id of windows virtual machine scale set"
  value       = join("", azurerm_windows_virtual_machine_scale_set.windows.id)
}
output "azurerm_linux_virtual_machine_scale_set_id" {
  description = "Id of linux virtual machine scale set"
  value       = join("", azurerm_linux_virtual_machine_scale_set.linux.id)
}

