

###################################### Windows VMSS ###################################### 

resource "azurerm_windows_virtual_machine_scale_set" "windows" {
  count               = var.os_flavor == "Windows" ? 1 : 0
  name                = var.vmss_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.vmss_sku
  instances           = var.vmss_instances
  admin_password      = var.vmss_admin_password
  admin_username      = var.vmss_admin_username

  dynamic "additional_capabilities" {
    for_each = length(var.additional_capabilities) == 0 ? [] : [var.additional_capabilities]
    content {
      ultra_ssd_enabled = lookup(additional_capabilities.value, "ultra_ssd_enabled")
    }
  }

  dynamic "additional_unattend_content" {
    for_each = length(var.additional_unattend_content) == 0 ? [] : [var.additional_unattend_content]
    content {
      content = lookup(additional_unattend_content.value, "content")
      setting = lookup(additional_unattend_content.value, "setting")
    }
  }

  dynamic "automatic_instance_repair" {
    for_each = length(var.automatic_instance_repair) == 0 ? [] : [var.automatic_instance_repair]
    content {
      enabled      = lookup(automatic_instance_repair.value, "enabled")
      grace_period = lookup(automatic_instance_repair.value, "grace_period")
    }
  }

  dynamic "automatic_os_upgrade_policy" {
    for_each = length(var.automatic_os_upgrade_policy) == 0 ? [] : [var.automatic_os_upgrade_policy]
    content {
      disable_automatic_rollback  = lookup(automatic_os_upgrade_policy.value, "disable_automatic_rollback")
      enable_automatic_os_upgrade = lookup(automatic_os_upgrade_policy.value, "enable_automatic_os_upgrade")
    }
  }

  dynamic "boot_diagnostics" {
    for_each = length(var.boot_diagnostics) == 0 ? [] : [var.boot_diagnostics]
    content {
      storage_account_uri = lookup(boot_diagnostics.value, "storage_account_uri")
    }
  }

  computer_name_prefix                              = var.vmss_computer_name_prefix
  custom_data                                       = var.vmss_custom_data
  do_not_run_extensions_on_overprovisioned_machines = var.vmss_do_not_run_extensions_on_overprovisioned_machines
  edge_zone                                         = var.vmss_edge_zone
  enable_automatic_updates                          = var.vmss_enable_automatic_updates
  encryption_at_host_enabled                        = var.vmss_encryption_at_host_enabled

  dynamic "extension" {
    for_each = length(var.extension) == 0 ? [] : [var.extension]
    content {
      name                       = lookup(extension.value, "name")
      auto_upgrade_minor_version = lookup(extension.value, "auto_upgrade_minor_version")
      automatic_upgrade_enabled  = lookup(extension.value, "automatic_upgrade_enabled")
      force_update_tag           = lookup(extension.value, "force_update_tag")
      publisher                  = lookup(extension.value, "publisher")
      type                       = lookup(extension.value, "type")
      type_handler_version       = lookup(extension.value, "type_handler_version")
      protected_settings         = lookup(extension.value, "protected_settings")
      provision_after_extensions = lookup(extension.value, "provision_after_extensions")
      settings                   = lookup(extension.value, "settings")
    }
  }

  extensions_time_budget = var.vmss_extensions_time_budget
  eviction_policy        = var.vmss_eviction_policy
  health_probe_id        = var.vmss_health_probe_id

  dynamic "identity" {
    for_each = length(var.identity) == 0 ? [] : [var.identity]
    content {
      identity_ids = lookup(identity.value, "identity_ids")
      type         = lookup(identity.value, "type")
    }
  }

  max_bid_price = var.vmss_max_bid_price
  overprovision = var.vmss_overprovision

  dynamic "plan" {
    for_each = length(var.plan) == 0 ? [] : [var.plan]
    content {
      name      = lookup(plan.value, "name")
      product   = lookup(plan.value, "product")
      publisher = lookup(plan.value, "publisher")
    }
  }

  dynamic "data_disk" {
    for_each = length(var.data_disk) == 0 ? [] : [var.data_disk]
    content {
      caching                        = lookup(data_disk.value, "caching")
      create_option                  = lookup(data_disk.value, "create_option")
      disk_encryption_set_id         = lookup(data_disk.value, "disk_encryption_set_id")
      disk_size_gb                   = lookup(data_disk.value, "disk_size_gb")
      lun                            = lookup(data_disk.value, "lun")
      storage_account_type           = lookup(data_disk.value, "storage_account_type")
      ultra_ssd_disk_iops_read_write = lookup(data_disk.value, "ultra_ssd_disk_iops_read_write")
      ultra_ssd_disk_mbps_read_write = lookup(data_disk.value, "ultra_ssd_disk_mbps_read_write")
      write_accelerator_enabled      = lookup(data_disk.value, "write_accelerator_enabled")
    }
  }

  platform_fault_domain_count  = var.vmss_platform_fault_domain_count
  priority                     = var.vmss_priority
  provision_vm_agent           = var.vmss_provision_vm_agent
  proximity_placement_group_id = var.vmss_proximity_placement_group_id

  dynamic "rolling_upgrade_policy" {
    for_each = length(var.rolling_upgrade_policy) == 0 ? [] : [var.rolling_upgrade_policy]
    content {
      max_batch_instance_percent              = lookup(rolling_upgrade_policy.value, "max_batch_instance_percent")
      max_unhealthy_instance_percent          = lookup(rolling_upgrade_policy.value, "max_unhealthy_instance_percent")
      max_unhealthy_upgraded_instance_percent = lookup(rolling_upgrade_policy.value, "max_unhealthy_upgraded_instance_percent")
      pause_time_between_batches              = lookup(rolling_upgrade_policy.value, "pause_time_between_batches")
    }
  }

  scale_in_policy = var.vmss_scale_in_policy

  dynamic "secret" {
    for_each = length(var.secret) == 0 ? [] : [var.secret]
    content {
      dynamic "certificate" {
        for_each = length(keys(lookup(secret.value, "certificate"))) == 0 ? [] : [lookup(secret.value, "certificate")]
        content {
          store = lookup(certificate.value, "store")
          url   = lookup(certificate.value, "url")
        }
      }
      key_vault_id = lookup(plan.secret, "key_vault_id")
    }
  }
  secure_boot_enabled    = var.vmss_secure_boot_enabled
  single_placement_group = var.vmss_single_placement_group
  source_image_id        = var.vmss_source_image_id

  dynamic "termination_notification" {
    for_each = length(var.termination_notification) == 0 ? [] : [var.termination_notification]
    content {
      enabled = lookup(termination_notification.value, "enabled")
      timeout = lookup(termination_notification.value, "timeout")
    }
  }

  tags         = var.vmss_tags
  timezone     = var.vmss_timezone
  upgrade_mode = var.vmss_upgrade_mode
  vtpm_enabled = var.vmss_vtpm_enabled

  dynamic "winrm_listener" {
    for_each = length(var.winrm_listener) == 0 ? [] : [var.winrm_listener]
    content {
      certificate_url = lookup(winrm_listener.value, "certificate_url")
      protocol        = lookup(winrm_listener.value, "protocol")
    }
  }
  zone_balance = var.vmss_zone_balance
  zones        = var.vmss_zones

  dynamic "source_image_reference" {
    for_each = length(var.source_image_reference) == 0 ? [] : [var.source_image_reference]
    content {
      publisher = lookup(source_image_reference.value, "publisher")
      offer     = lookup(source_image_reference.value, "offer")
      sku       = lookup(source_image_reference.value, "sku")
      version   = lookup(source_image_reference.value, "version")
    }
  }

  dynamic "os_disk" {
    for_each = length(var.os_disk) == 0 ? [] : [var.os_disk]
    content {
      storage_account_type      = lookup(os_disk.value, "storage_account_type")
      caching                   = lookup(os_disk.value, "caching")
      disk_encryption_set_id    = lookup(os_disk.value, "disk_encryption_set_id")
      disk_size_gb              = lookup(os_disk.value, "disk_size_gb")
      write_accelerator_enabled = lookup(os_disk.value, "write_accelerator_enabled")
      # dynamic "diff_disk_settings" {
      #   for_each = length(keys(lookup(os_disk.value, "diff_disk_settings"))) == 0 ? [] : [lookup(os_disk.value, "diff_disk_settings")]
      #   # option = lookup(diff_disk_settings.value, "option")
      # }
    }
  }

  dynamic "network_interface" {
    for_each = length(var.network_interface) == 0 ? [] : [var.network_interface]
    content {
      name                          = lookup(network_interface.value, "name", "example")
      primary                       = lookup(network_interface.value, "primary", true)
      dns_servers                   = lookup(network_interface.value, "dns_servers", null)
      enable_accelerated_networking = lookup(network_interface.value, "enable_accelerated_networking", null)
      enable_ip_forwarding          = lookup(network_interface.value, "enable_ip_forwarding", null)
      network_security_group_id     = lookup(network_interface.value, "network_security_group_id", null)

      dynamic "ip_configuration" {
        for_each = length(keys(lookup(network_interface.value, "ip_configuration"))) == 0 ? [] : [lookup(network_interface.value, "ip_configuration")]
        content {
          name                                         = lookup(ip_configuration.value, "name", "internal")
          primary                                      = lookup(ip_configuration.value, "primary", true)
          subnet_id                                    = var.subnet_id
          application_gateway_backend_address_pool_ids = lookup(ip_configuration.value, "application_gateway_backend_address_pool_ids", null)
          application_security_group_ids               = lookup(ip_configuration.value, "application_security_group_ids", null)
          load_balancer_backend_address_pool_ids       = lookup(ip_configuration.value, "load_balancer_backend_address_pool_ids", null)
          load_balancer_inbound_nat_rules_ids          = lookup(ip_configuration.value, "load_balancer_inbound_nat_rules_ids", null)
          version                                      = lookup(ip_configuration.value, "version", null)

          dynamic "public_ip_address" {
            for_each = length(keys(lookup(ip_configuration.value, "public_ip_address"))) == 0 ? [] : [lookup(ip_configuration.value, "public_ip_address")]
            content {
              domain_name_label       = lookup(public_ip_address.value, "domain_name_label", null)
              idle_timeout_in_minutes = lookup(public_ip_address.value, "idle_timeout_in_minutes", null)
              public_ip_prefix_id     = lookup(public_ip_address.value, "public_ip_prefix_id", null)
              name                    = lookup(public_ip_address.value, "name", "ppip")

              dynamic "ip_tag" {
                for_each = length(keys(lookup(public_ip_address.value, "ip_tag", {}))) == 0 ? [] : [lookup(public_ip_address.value, "ip_tag", {})]
                content {
                  tag  = lookup(ip_tag.value, "tag")
                  type = lookup(ip_tag.value, "type")
                }
              }
            }
          }
        }
      }
    }
  }
}

###################################### Linux VMSS ###################################### 


resource "azurerm_linux_virtual_machine_scale_set" "linux" {
  count               = var.os_flavor == "Linux" ? 1 : 0
  name                = var.vmss_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.vmss_sku
  instances           = var.vmss_instances
  admin_username      = var.vmss_admin_username
  admin_password      = var.vmss_admin_password

  admin_ssh_key {
    username   = var.vmss_admin_username
    public_key = var.public_key
  }

  dynamic "source_image_reference" {
    for_each = length(var.source_image_reference) == 0 ? [] : [var.source_image_reference]
    content {
      publisher = lookup(source_image_reference.value, "publisher")
      offer     = lookup(source_image_reference.value, "offer")
      sku       = lookup(source_image_reference.value, "sku")
      version   = lookup(source_image_reference.value, "version")
    }
  }

  dynamic "os_disk" {
    for_each = length(var.os_disk) == 0 ? [] : [var.os_disk]
    content {
      storage_account_type      = lookup(os_disk.value, "storage_account_type")
      caching                   = lookup(os_disk.value, "caching")
      disk_encryption_set_id    = lookup(os_disk.value, "disk_encryption_set_id")
      disk_size_gb              = lookup(os_disk.value, "disk_size_gb")
      write_accelerator_enabled = lookup(os_disk.value, "write_accelerator_enabled")
      # dynamic "diff_disk_settings" {
      #   for_each = length(keys(lookup(os_disk.value, "diff_disk_settings"))) == 0 ? [] : [lookup(os_disk.value, "diff_disk_settings")]
      #   option = lookup(diff_disk_settings.value, "option")
      # }
    }
  }

  dynamic "network_interface" {
    for_each = length(var.network_interface) == 0 ? [] : [var.network_interface]
    content {
      name                          = lookup(network_interface.value, "name")
      primary                       = lookup(network_interface.value, "primary")
      dns_servers                   = lookup(network_interface.value, "dns_servers")
      enable_accelerated_networking = lookup(network_interface.value, "enable_accelerated_networking")
      enable_ip_forwarding          = lookup(network_interface.value, "enable_ip_forwarding")
      network_security_group_id     = lookup(network_interface.value, "network_security_group_id")

      dynamic "ip_configuration" {
        for_each = length(keys(lookup(network_interface.value, "ip_configuration"))) == 0 ? [] : [lookup(network_interface.value, "ip_configuration")]
        content {
          name                                         = lookup(ip_configuration.value, "name")
          primary                                      = lookup(ip_configuration.value, "primary")
          subnet_id                                    = var.subnet_id
          application_gateway_backend_address_pool_ids = lookup(ip_configuration.value, "application_gateway_backend_address_pool_ids")
          application_security_group_ids               = lookup(ip_configuration.value, "application_security_group_ids")
          #load_balancer_backend_address_pool_ids            = var.load_balancer_backend_address_pool_ids == true ? 1 : 0
          #load_balancer_backend_address_pool_ids       = [length(var.load_balancer_backend_address_pool_ids) >= 1 ? var.load_balancer_backend_address_pool_ids : null ] #lookup(ip_configuration.value, "load_balancer_backend_address_pool_ids")
           load_balancer_backend_address_pool_ids       = var.load_balancer_backend_address_pool_ids == "" ? null : var.load_balancer_backend_address_pool_ids  #lookup(ip_configuration.value, "load_balancer_backend_address_pool_ids")

          load_balancer_inbound_nat_rules_ids          = lookup(ip_configuration.value, "load_balancer_inbound_nat_rules_ids")
          version                                      = lookup(ip_configuration.value, "version")

#           dynamic "public_ip_address" {
#             for_each = length(keys(lookup(ip_configuration.value, "public_ip_address"))) == 0 ? [] : [lookup(ip_configuration.value, "public_ip_address")]
#             content {
#               domain_name_label       = lookup(public_ip_address.value, "domain_name_label")
#               idle_timeout_in_minutes = lookup(public_ip_address.value, "idle_timeout_in_minutes")
#               public_ip_prefix_id     = lookup(public_ip_address.value, "public_ip_prefix_id")
#               name                    = lookup(public_ip_address.value, "name")

#               dynamic "ip_tag" {
#                 for_each = length(keys(lookup(public_ip_address.value, "ip_tag"))) == 0 ? [] : [lookup(public_ip_address.value, "ip_tag")]
#                 content {
#                   tag  = lookup(ip_tag.value, "tag")
#                   type = lookup(ip_tag.value, "type")
#                 }
#               }
#             }
#           }
        }
      }
    }
  }

  dynamic "additional_capabilities" {
    for_each = length(var.additional_capabilities) == 0 ? [] : [var.additional_capabilities]
    content {
      ultra_ssd_enabled = lookup(additional_capabilities.value, "ultra_ssd_enabled")
    }
  }

  dynamic "automatic_os_upgrade_policy" {
    for_each = length(var.automatic_os_upgrade_policy) == 0 ? [] : [var.automatic_os_upgrade_policy]
    content {
      disable_automatic_rollback  = lookup(automatic_os_upgrade_policy.value, "disable_automatic_rollback")
      enable_automatic_os_upgrade = lookup(automatic_os_upgrade_policy.value, "enable_automatic_os_upgrade")
    }
  }

  dynamic "automatic_instance_repair" {
    for_each = length(var.automatic_instance_repair) == 0 ? [] : [var.automatic_instance_repair]
    content {
      enabled      = lookup(automatic_instance_repair.value, "enabled")
      grace_period = lookup(automatic_instance_repair.value, "grace_period")
    }
  }

  dynamic "boot_diagnostics" {
    for_each = length(var.boot_diagnostics) == 0 ? [] : [var.boot_diagnostics]
    content {
      storage_account_uri = lookup(boot_diagnostics.value, "storage_account_uri")
    }
  }
  computer_name_prefix = var.vmss_computer_name_prefix
  custom_data          = var.vmss_custom_data
  dynamic "data_disk" {
    for_each = length(var.data_disk) == 0 ? [] : [var.data_disk]
    content {
      caching                        = lookup(data_disk.value, "caching")
      create_option                  = lookup(data_disk.value, "create_option")
      disk_encryption_set_id         = lookup(data_disk.value, "disk_encryption_set_id")
      disk_size_gb                   = lookup(data_disk.value, "disk_size_gb")
      lun                            = lookup(data_disk.value, "lun")
      storage_account_type           = lookup(data_disk.value, "storage_account_type")
      ultra_ssd_disk_iops_read_write = lookup(data_disk.value, "ultra_ssd_disk_iops_read_write")
      ultra_ssd_disk_mbps_read_write = lookup(data_disk.value, "ultra_ssd_disk_mbps_read_write")
      write_accelerator_enabled      = lookup(data_disk.value, "write_accelerator_enabled")
    }
  }

  disable_password_authentication                   = var.vmss_disable_password_authentication
  do_not_run_extensions_on_overprovisioned_machines = var.vmss_do_not_run_extensions_on_overprovisioned_machines
  edge_zone                                         = var.vmss_edge_zone
  encryption_at_host_enabled                        = var.vmss_encryption_at_host_enabled
  dynamic "extension" {
    for_each = length(var.extension) == 0 ? [] : [var.extension]
    content {
      name                       = lookup(extension.value, "name")
      auto_upgrade_minor_version = lookup(extension.value, "auto_upgrade_minor_version")
      automatic_upgrade_enabled  = lookup(extension.value, "automatic_upgrade_enabled")
      force_update_tag           = lookup(extension.value, "force_update_tag")
      publisher                  = lookup(extension.value, "publisher")
      type                       = lookup(extension.value, "type")
      type_handler_version       = lookup(extension.value, "type_handler_version")
      protected_settings         = lookup(extension.value, "protected_settings")
      provision_after_extensions = lookup(extension.value, "provision_after_extensions")
      settings                   = lookup(extension.value, "settings")
    }
  }

  extensions_time_budget = var.vmss_extensions_time_budget
  eviction_policy        = var.vmss_eviction_policy
  health_probe_id        = var.vmss_health_probe_id
  dynamic "identity" {
    for_each = length(var.identity) == 0 ? [] : [var.identity]
    content {
      identity_ids = lookup(identity.value, "identity_ids")
      type         = lookup(identity.value, "type")
    }
  }

  max_bid_price = var.vmss_max_bid_price
  overprovision = var.vmss_overprovision
  dynamic "plan" {
    for_each = length(var.plan) == 0 ? [] : [var.plan]
    content {
      name      = lookup(plan.value, "name")
      product   = lookup(plan.value, "product")
      publisher = lookup(plan.value, "publisher")
    }
  }

  platform_fault_domain_count  = var.vmss_platform_fault_domain_count
  priority                     = var.vmss_priority
  provision_vm_agent           = var.vmss_provision_vm_agent
  proximity_placement_group_id = var.vmss_proximity_placement_group_id
  dynamic "rolling_upgrade_policy" {
    for_each = length(var.rolling_upgrade_policy) == 0 ? [] : [var.rolling_upgrade_policy]
    content {
      max_batch_instance_percent              = lookup(rolling_upgrade_policy.value, "max_batch_instance_percent")
      max_unhealthy_instance_percent          = lookup(rolling_upgrade_policy.value, "max_unhealthy_instance_percent")
      max_unhealthy_upgraded_instance_percent = lookup(rolling_upgrade_policy.value, "max_unhealthy_upgraded_instance_percent")
      pause_time_between_batches              = lookup(rolling_upgrade_policy.value, "pause_time_between_batches")
    }
  }

  scale_in_policy = var.vmss_scale_in_policy

  dynamic "secret" {
    for_each = length(var.secret) == 0 ? [] : [var.secret]
    content {
      dynamic "certificate" {
        for_each = length(keys(lookup(secret.value, "certificate"))) == 0 ? [] : [lookup(secret.value, "certificate")]
        content {
          # store = lookup(certificate.value, "store")
          url = lookup(certificate.value, "url")
        }
      }
      key_vault_id = lookup(plan.secret, "key_vault_id")
    }
  }

  secure_boot_enabled    = var.vmss_secure_boot_enabled
  single_placement_group = var.vmss_single_placement_group
  source_image_id        = var.vmss_source_image_id
  tags                   = var.vmss_tags
  dynamic "termination_notification" {
    for_each = length(var.termination_notification) == 0 ? [] : [var.termination_notification]
    content {
      enabled = lookup(termination_notification.value, "enabled")
      timeout = lookup(termination_notification.value, "timeout")
    }
  }
  upgrade_mode = var.vmss_upgrade_mode
  vtpm_enabled = var.vmss_vtpm_enabled
  zone_balance = var.vmss_zone_balance
  zones        = var.vmss_zones
}
