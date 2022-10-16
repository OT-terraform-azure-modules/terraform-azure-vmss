variable "load_balancer_backend_address_pool_ids" {
  description = "value"
  #type        = string
  default = [""]
}


variable "resource_group_name" {
  description = "value"
  type        = string
  default     = "rg-himanshu"
}

variable "location" {
  description = "value"
  type        = string
  default     = "Australia East"
}

variable "subnet_id" {
  description = "value"
  type        = string
}

variable "vnet_name" {
  description = "value"
  type        = string
  default     = "example-network"
}

variable "vnet_address_space" {
  description = "value"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "value"
  type        = string
  default     = "subnet-01"
}

variable "subnet_address_prefixes" {
  description = "value"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "vmss_name" {
  description = "value"
  type        = string
  default     = "example-vmss"
}

variable "vmss_sku" {
  description = "value"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vmss_instances" {
  description = "value"
  type        = number
  default     = 1
}

variable "vmss_admin_password" {
  description = "value"
  type        = string
  default     = "P@55w0rd1234!"
}

variable "vmss_admin_username" {
  description = "value"
  type        = string
  default     = "opstree"
}

variable "vmss_computer_name_prefix" {
  description = "value"
  type        = string
  default     = "testWin"
}

variable "vmss_custom_data" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_do_not_run_extensions_on_overprovisioned_machines" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_edge_zone" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_enable_automatic_updates" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_encryption_at_host_enabled" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_extensions_time_budget" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_eviction_policy" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_health_probe_id" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_max_bid_price" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_overprovision" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_platform_fault_domain_count" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_priority" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_provision_vm_agent" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_proximity_placement_group_id" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_scale_in_policy" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_secure_boot_enabled" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_single_placement_group" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_source_image_id" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_timezone" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_upgrade_mode" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_vtpm_enabled" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_zone_balance" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_zones" {
  description = "value"
  type        = set(string)
  default     = null
}

variable "vmss_disable_password_authentication" {
  description = "value"
  type        = bool
  default     = true
}

variable "additional_capabilities" {
  type        = list(any)
  description = "value"
}

variable "additional_unattend_content" {
  type        = list(any)
  description = "value"
}

variable "automatic_instance_repair" {
  type        = list(any)
  description = "value"
}

variable "automatic_os_upgrade_policy" {
  type        = list(any)
  description = ""
}

variable "boot_diagnostics" {
  type        = list(any)
  description = ""
}

variable "extension" {
  type        = list(any)
  description = ""
}

variable "identity" {
  type        = list(any)
  description = ""
}

variable "plan" {
  type        = list(any)
  description = ""
}

variable "data_disk" {
  type        = list(any)
  description = ""
}

variable "rolling_upgrade_policy" {
  type        = list(any)
  description = ""
}

variable "secret" {
  type        = list(any)
  description = ""
}

variable "certificate" {
  type        = list(any)
  description = ""
}

variable "termination_notification" {
  type        = list(any)
  description = ""
}

variable "vmss_tags" {
  type        = map(string)
  description = ""
  default     = null
}

variable "winrm_listener" {
  type        = list(any)
  description = ""
}

variable "diff_disk_settings" {
  type        = list(any)
  description = ""
}

variable "ip_tag" {
  type        = list(any)
  description = ""
}


#For Windows
variable "source_image_reference" {
  type = any
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "Latest"
  }
}

variable "os_disk" {
  type        = any
  description = ""
  default = {
    storage_account_type      = "Standard_LRS"
    caching                   = "ReadWrite"
    disk_encryption_set_id    = null
    disk_size_gb              = null
    write_accelerator_enabled = null
  }
}

variable "network_interface" {
  type        = any
  description = ""
}

variable "ip_configuration" {
  type        = list(any)
  description = ""
}

# variable "admin_ssh_key" {
#   type = any
#   description = ""
# }


# For Linux
# variable "source_image_reference" {
#   type = list(any)
#   description = ""
#     default = [
#     {
#       publisher = "Canonical"
#       offer     = "UbuntuServer"
#       sku       = "16.04-LTS"
#       version   = "Latest"
#     }
#   ]

# }

# variable "vmss_additional_capabilities_ultra_ssd_enabled" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_additional_unattend_content_content" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_additional_unattend_content_setting" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_automatic_instance_repair_enabled" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_automatic_instance_repair_grace_period" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_automatic_os_upgrade_policy_disable_automatic_rollback" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_automatic_os_upgrade_policy_enable_automatic_os_upgrade" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_boot_diagnostics_storage_account_uri" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_name" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_auto_upgrade_minor_version" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_automatic_upgrade_enabled" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_force_update_tag" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_publisher" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_type" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_type_handler_version" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_protected_settings" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_provision_after_extensions" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_extension_settings" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_identity_ids" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_identity_type" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_plan_name" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_plan_product" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_plan_publisher" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_data_disk_caching" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_data_disk_create_option" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_data_disk_disk_encryption_set_id" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_data_disk_disk_size_gb" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_data_disk_lun" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_data_disk_storage_account_type" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_data_disk_ultra_ssd_disk_iops_read_write" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_data_disk_ultra_ssd_disk_mbps_read_write" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_data_disk_write_accelerator_enabled" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_rolling_upgrade_policy_max_batch_instance_percent" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_rolling_upgrade_policy_pause_time_between_batches" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_rolling_upgrade_policy_max_unhealthy_upgraded_instance_percent" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_rolling_upgrade_policy_max_unhealthy_instance_percent" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_secret_key_vault_id" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_secret_certificate_store" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_secret_certificate_url" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_winrm_listener_certificate_url" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_winrm_listener_protocol" {
#   description = "value"
#   type        = string
#   default     = null
# }

variable "vmss_source_image_reference_publisher" {
  description = "value"
  type        = string
  default     = "Canonical" #"MicrosoftWindowsServer"
  # "Canonical" for Linux
}

variable "vmss_source_image_reference_offer" {
  description = "value"
  type        = string
  default     = "UbuntuServer" #"WindowsServer"
  # "UbuntuServer" for Linux
}

variable "vmss_source_image_reference_sku" {
  description = "value"
  type        = string
  default     = "16.04-LTS" #"2016-Datacenter-Server-Core"
  # "16.04-LTS" for Linux
}

variable "vmss_source_image_reference_version" {
  description = "value"
  type        = string
  default     = "latest"
}

variable "vmss_os_disk_storage_account_type" {
  description = "value"
  type        = string
  default     = "Standard_LRS"
}

variable "vmss_os_disk_caching" {
  description = "value"
  type        = string
  default     = "ReadWrite"
}

variable "vmss_os_disk_disk_encryption_set_id" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_os_disk_disk_size_gb" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_os_disk_write_accelerator_enabled" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_os_disk_diff_disk_settings_option" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_network_interface_name" {
  description = "value"
  type        = string
  default     = "example"
}

variable "vmss_network_interface_primary" {
  description = "value"
  type        = bool
  default     = true
}

variable "vmss_network_interface_dns_servers" {
  description = "value"
  type        = list(string)
  default     = null
}

variable "vmss_network_interface_enable_accelerated_networking" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_network_interface_enable_ip_forwarding" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_network_interface_network_security_group_id" {
  description = "value"
  type        = list(string)
  default     = null
}

variable "vmss_network_interface_ip_configuration_name" {
  description = "value"
  type        = string
  default     = "internal"
}

variable "vmss_network_interface_ip_configuration_primary" {
  description = "value"
  type        = bool
  default     = true
}

variable "vmss_network_interface_ip_configuration_application_gateway_backend_address_pool_ids" {
  description = "value"
  type        = set(string)
  default     = null
}

variable "vmss_network_interface_ip_configuration_application_security_group_ids" {
  description = "value"
  type        = set(string)
  default     = null
}

variable "vmss_network_interface_ip_configuration_load_balancer_backend_address_pool_ids" {
  description = "value"
  type        = set(string)
  default     = null
}

variable "vmss_network_interface_ip_configuration_load_balancer_inbound_nat_rules_ids" {
  description = "value"
  type        = set(string)
  default     = null
}

variable "vmss_network_interface_ip_configuration_version" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_network_interface_ip_configuration_public_ip_address_domain_name_label" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_network_interface_ip_configuration_public_ip_address_idle_timeout_in_minutes" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_network_interface_ip_configuration_public_ip_address_public_ip_prefix_id" {
  description = "value"
  type        = string
  default     = null
}

variable "vmss_network_interface_ip_configuration_public_ip_address_name" {
  description = "value"
  type        = string
  default     = "ppipp"
}

# variable "vmss_network_interface_ip_configuration_public_ip_address_ip_tag_tag" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "vmss_network_interface_ip_configuration_public_ip_address_ip_tag_type" {
#   description = "value"
#   type        = string
#   default     = null
# }

# variable "username" {
#   description = "value"
#   type        = string
# }

variable "public_key" {
  description = "value"
  type        = any
}

variable "os_flavor" {
  description = "value"
  type        = string
  default     = "Windows"
}

variable "linux_image_reference" {
  description = "List of ARM role receivers"
  type = list(object({
    publisher = string,
    offer     = string,
    sku       = string,
    version   = string
  }))

  default = []
  # [{
  #   publisher = "Canonical",
  #   offer     = "UbuntuServer",
  #   sku       = "16.04-LTS",
  #   version   = "latest"
  # }]
}

# variable "windows_image_reference" {
#   description = "List of ARM role receivers"
#   type = list(object({
#     publisher = string,
#     offer     = string,
#     sku       = string,
#     version   = string
#   }))

#   default = []
#   # [{
#   #   publisher = "CanoniMicrosoftWindowsServercal",
#   #   offer     = "WindowsServer",
#   #   sku       = "16.04-LTS",
#   #   version   = "latest"
#   # }]
# }

# variable "linux_admin_ssh_key" {
#   description = "List of ARM role receivers"
#   type = list(object({
#     username   = string, #(Required) The name of the ARM role receiver.
#     public_key = string  #(Required) The arm role id.
#   }))
# }
