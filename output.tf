output "linux_virtual_machine_scale_set_id" {
  description = "The resource ID of the Linux Virtual Machine Scale Set."
  value       = var.os_flavor == "Linux" ? azurerm_linux_virtual_machine_scale_set.linux_vmss.*.id : null
}
