
# Azure VMSS Terraform Module

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

- This terraform module will virtual machine scale set
- This project is a part of opstree's ot-azure initiative for terraform modules

## Information

Azure virtual machine scale sets let you create and manage a group of load balanced VMs. The number of VM instances can automatically increase or decrease in response to demand or a defined schedule. Scale sets provide high availability to your applications, and allow you to centrally manage, configure, and update a large number of VMs. With virtual machine scale sets, you can build large-scale services for areas such as compute, big data, and container workloads.



## Resources Supported
- [Resource Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
- [VNet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)
- [subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)
- [Vritual Machine Scale Set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_scale_set)

## Module Usage
```

# vmss module

module "vmss" {
  source                      = "../"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  vnet_name                   = var.vnet_name
  vnet_address_space          = var.vnet_address_space
  subnet_name                 = var.subnet_name
  subnet_address_prefixes     = var.subnet_address_prefixes
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
```

## Inputs
Name | Description | Type | Default | Required
-----|-------------|------|---------|:--------:
`resource_group_name` | The name of resource group | string |  | Yes |
`location` | The location of resource group | string |  | Yes |
`vnet_name` | The name of vnet | string |  | Yes |
`vnet_address_space` | The CIDR range for vnet | list |  | No |
`subnet_name` | The name for subnet | string |  | No |
`subent_address_prefixes` | The CIDR range for subnet ip address | list |  | No |
`vmss_name` | The name for vmss | string |  | No |
`vmss_sku` | The sku for vmss | string | Standard | No |
`vmss_instances` | The number of instances for vmss | number |  | Yes |
`vmss_admin_password` | The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created | string |  | Yes |
`vmss_admin_username` | The username of the local administrator on each Virtual Machine Scale Set instance. Changing this forces a new resource to be created | string |  | Yes |
`vmss_computer_name_prefix` | The prefix which should be used for the name of the Virtual Machines in this Scale Set. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name_prefix, then you must specify computer_name_prefix | string |  | No |
`vmss_custom_data` | The Base64-Encoded Custom Data which should be used for this Virtual Machine Scale Set | string |  | No |
`vmss_edge_zone` |  Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine Scale Set should exist. Changing this forces a new Linux Virtual Machine Scale Set to be created.| string |  | No |
`vmss_enable_automatic_updates` |  Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host? | string |  | No |
`vmss_encryption_at_host_enabled` | Enable encryption at host | bool |  | No |
`vmss_extensions_time_budget` | Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M) | string | 90 | No |
`vmss_eviction_policy` |  The Policy which should be used Virtual Machines are Evicted from the Scale Set. Changing this forces a new resource to be created | string |  | No |
`vmss_health_probe_id` |  The ID of a Load Balancer Probe which should be used to determine the health of an instance. This is Required and can only be specified when upgrade_mode is set to Automatic or Rolling | string |  | Yes |
`vmss_max_bid_price` |  The maximum price you're willing to pay for each Virtual Machine in this Scale Set, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machines in the Scale Set will be evicted using the eviction_policy. Defaults to -1, which means that each Virtual Machine in this Scale Set should not be evicted for price reasons | string | -1 | No |
`vmss_overprovision` |  Should Azure over-provision Virtual Machines in this Scale Set? This means that multiple Virtual Machines will be provisioned and Azure will keep the instances which become available first - which improves provisioning success rates and improves deployment time. You're not billed for these over-provisioned VM's and they don't count towards the Subscription Quota. Defaults to true | bool | true | No |
`vmss_platform_fault_domain_count` |  Specifies the number of fault domains that are used by this Linux Virtual Machine Scale Set. Changing this forces a new resource to be created | string |  | No |
`vmss_priority` | Optional) The Priority of this Virtual Machine Scale Set. Possible values are Regular and Spot. Defaults to Regular. Changing this value forces a new resource | string | Regular | No | 
`vmss_provision_vm_agent` | Should the Azure VM Agent be provisioned on each Virtual Machine in the Scale Set? Defaults to true. Changing this value forces a new resource to be created | bool | true | No |
`vmss_proximity_placement_group_id` | The ID of the Proximity Placement Group in which the Virtual Machine Scale Set should be assigned to. Changing this forces a new resource to be created | string |  | No |
`vmss_sclae_in_polcy` | The scale-in policy rule that decides which virtual machines are chosen for removal when a Virtual Machine Scale Set is scaled in. Possible values for the scale-in policy rules are Default, NewestVM and OldestVM, defaults to Default | string | default | No |
`vmss_secure_boot_enabled` | Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created | string |  | No |
`vmss_single_placement_group` | Should this Virtual Machine Scale Set be limited to a Single Placement Group, which means the number of instances will be capped at 100 Virtual Machines | bool | true | No |
`vmss_source_image_id` | The ID of an Image which each Virtual Machine in this Scale Set should be based on | string |  | No |
`vmss_timezone` | The timezome for vmss | string | UTC | No |
`vmss_upgrade_mode` | Specifies the mode of an upgrade to virtual machines in the scale set. Possible values, Rolling, Manual, or Automatic. When choosing Rolling, you will need to set a health probe | string |  | Yes |
`vmss_vtpm_enabled` | Specifies whether vTPM should be enabled on the virtual machine. Changing this forces a new resource to be created | string |  | No |
`vmss_zone_balance` | Should the Virtual Machines in this Scale Set be strictly evenly distributed across Availability Zones? Defaults to false. Changing this forces a new resource to be created | bool | false | No |
`vmss_zones` | Specifies a list of Availability Zones in which this Linux Virtual Machine Scale Set should be located. Changing this forces a new Linux Virtual Machine Scale Set to be created | set |  | No |
`vmss_disable_password_authentication` | Specifies whether password authentication should be disabled. Defaults to false. Changing this forces a new resource to be created | bool | false | No |
`additional_capabilities` | A additional_capabilities| list |  | No |
`additional_unattend_content` | List of additional unwanted content | list |  | No |
`automatic_instance_repair` |  To enable the automatic instance repair, this Virtual Machine Scale Set must have a valid health_probe_id or an Application Health Extension. | list |  | No |
`automatic_os_upgrade_policy` |  A automatic_os_upgrade_policy block as defined below. This can only be specified when upgrade_mode is set to Automatic | list |  | No |
`boot_diagnostics` |  A boot_diagnostics| list |  | No |
`extension` |  (Required) The name for the Virtual Machine Scale Set Extension | list |  | Yes |
`identity` | Specifies a list of user managed identity ids to be assigned to the VMSS. Required if type is UserAssigned | list |  | Yes |
`plan` | Specifies the name of the image from the marketplace | list |  | Yes |
`data_disk ` | A storage profile data disk  | list |  | No |
`secret` |  Specifies a list of user managed identity ids to be assigned to the VMSS | list |  | Yes|
`certificate` | (Required, on windows machines) A collection of Vault Certificates | list |  | Yes |
`termination_notification` | A termination_notification | list |  | No |
`tags` | The tags used for resources | map |  | No |
`winrm_listener` | A collection of WinRM configuration | list |  | No |
`os_disk` | The disk for virtual machine | any |  | Yes |
`vmss_source_image_reference_publisher` | The publisher for vmss source image | string |  | Yes |
`vmss_source_image_reference_offer` | Specifies the offer of the image used to create the virtual machine. Changing this forces a new resource to be created. sku | string |  | Yes |
`vmss_source_image_reference_sku` | The sku for vmss source image reference | string | | Yes |
`vmss_source_image_reference_version` | The version for vmms source image reference | string |  | ... 
`vmss_os_disk_storage_account_type ` | The type of disk storage account | string |  | No |
`vmss_os_disk_caching` | The type of os disk caching | string |  | No |
`vmss_os_disk_encryption_set_id` | The id of os disk encryption | string |  | No |
`vmss_os_disk_size_gb` | The disk size for vmss os in gb | string | " | Yes |
`vmss_os_disk_write_acceleration_enabled` | Specifies if Write Accelerator is enabled on the disk. This can only be enabled on Premium_LRS managed disks with no caching and M-Series VMs. Defaults to false | bool | false | No |
`vmss_os_disk_diff_disk_setings_option` | diff disk setting for vmss | string |  | No |
`vmss_network_interface_name` | The name of network interface for vmss | string |  | Yes |
`vmss_network_interface_primay` | The primary network interface for vmss | bool |  | No |
`vmss_network_interface_dns_servers` | A list of IP Addresses defining the DNS Servers which should be used for this Network Interface | list |  | No |
`vmss_network_interface_enable_accelerated_networking` | Should Accelerated Networking be enabled? Defaults to false | bool | false | No |
`vmss_network_interface_enable_ip_forwarding` | Should IP Forwarding be enabled? Defaults to false | string |  | No |
`vmss_network_interface_network_security_group_id` | The security group id for vmss network interface | string |  | No |
`vmss_network_interface_ip_configuration_name` | The ip configuration name for network interface | string |  | No |
`vmss_network_interface_ip_configuration_primary` | The configuration of vmss network interface | bool | true | No |
`vmss_network_interface_ip_configuration_application_gateway_backend_address_pool_ids` | The ID of network interface ip configuration load balancer backend address pool | set |  | Yes |
`vmss_network_interface_ip_configuration_application_security_group_ids` | The ID of vmss network interface ip configuration application gateway backend group | set |  | Yes |
`vmss_network_interface_ip_configuration_load_balancer_backend_address_pool_ids` | The ID of network interface ip configuration load balancer backend address pool | set | | No |
`vmss_network_interface_ip_configuration_load_balancer_inbound_nat_rules_ids`| The ID of load balancer inbound nat rules | set |  | Yes |
`vmss_network_interface_ip_configuration_version` | The version of vmss network interface ip configuration | string |  | No |
`vmss_network_interface_ip_configuration_public_ip_address_domain_name_label` | The label of vmss network interface ip configuration public ip address domain name | string |  | Yes |
`vmss_network_interface_ip_configuration_public_ip_address_idle_timeout_in_minutes` | Network interface ip configuration public ip address idle timeout in minutes value | string |  | Yes |
`vmss_network_interface_ip_configuration_public_ip_address_ip_prefix_id` | The ID of vmss network interface ip configuration public ip address | string |  | No |
`vmss_network_interface_ip_configuration_public_ip_address_name` | The name of vmss network interface ip configuration public ip address | string |  | No |
`os_flavour` | The flavour of OS for vmss | string |  | Yes |


## Outputs

Name | Description
-----|:----------:
`azurerm_resource_group_id` | The ID of resource group |
`azurerm_virtual_network_id` | The ID of virtual network |
`azurerm_subnet_id` | The id of subnet |
`azurerm_windows_virtual_machine_scale_set_id` | The ID  for windows virtual machin scale set |
`azurerm_linux_virtual_machine_scale_set` | The ID for linux virtual machine scale set |















## Contributors

- [@name](link)

