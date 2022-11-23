output "linux_virtual_machine_scale_set_id" {
  description = "The resource ID of the Linux Virtual Machine Scale Set."
  value       = azurerm_linux_virtual_machine_scale_set.linux[*].id
}

# output "linux_virtual_machine_scale_set_ip" {
#   description = "The private ip of the Linux Virtual Machine Scale Set."
#   value       = azurerm_linux_virtual_machine_scale_set.linux[*].private_ip_address
# }
