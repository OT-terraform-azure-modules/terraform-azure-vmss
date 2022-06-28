variable "resource_group_name" {
  description = "Name of Resource Group"
  type        = string
}

variable "location" {
  description = "The location of resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of vnet"
  type        = string
}

variable "vnet_address_space" {
  description = "The CIDR range for vnet"
  type        = list(string)
}

variable "subnet_name" {
  description = "The name for subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The CIDR range for subnet io address"
  type        = list(string)
}

variable "vmss_name" {
  description = "The name for vmss"
  type        = string
}

variable "vmss_sku" {
  description = "The sku for vmss"
  type        = string
}

variable "vmss_instances" {
  description = "The number of instances for vmss"
  type        = number
}

variable "vmss_admin_password" {
  description = "The password for vmss"
  type        = string
}

variable "vmss_admin_username" {
  description = "The username for vmss"
  type        = string
}

variable "vmss_computer_name_prefix" {
  description = "value"
  type        = string
}

variable "vmss_custom_data" {
  description = "value"
  type        = string
}

variable "vmss_do_not_run_extensions_on_overprovisioned_machines" {
  description = "(Optional) Should Virtual Machine Extensions be run on Overprovisioned Virtual Machines in the Scale Set? Defaults to false"
  type        = string
}

variable "vmss_edge_zone" {
  description = " Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine Scale Set should exist. Changing this forces a new Linux Virtual Machine Scale Set to be created"
  type        = string
}

variable "vmss_enable_automatic_updates" {
  description = "Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
  type        = string
}

variable "vmss_encryption_at_host_enabled" {
  description = "value"
  type        = string
}

variable "vmss_extensions_time_budget" {
  description = "Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M)"
  type        = string
}

variable "vmss_eviction_policy" {
  description = "The Policy which should be used Virtual Machines are Evicted from the Scale Set. Changing this forces a new resource to be created"
  type        = string
}

variable "vmss_health_probe_id" {
  description = "The ID of a Load Balancer Probe which should be used to determine the health of an instance. This is Required and can only be specified when upgrade_mode is set to Automatic or Rolling"
  type        = string
}

variable "vmss_max_bid_price" {
  description = "The maximum price you're willing to pay for each Virtual Machine in this Scale Set, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machines in the Scale Set will be evicted using the eviction_policy. Defaults to -1, which means that each Virtual Machine in this Scale Set should not be evicted for price reasons"
  type        = string
}

variable "vmss_overprovision" {
  description = "Should Azure over-provision Virtual Machines in this Scale Set? This means that multiple Virtual Machines will be provisioned and Azure will keep the instances which become available first - which improves provisioning success rates and improves deployment time. You're not billed for these over-provisioned VM's and they don't count towards the Subscription Quota. Defaults to true | boo"
  type        = string
}

variable "vmss_platform_fault_domain_count" {
  description = "The count of fault tolerant domain for vmss"
  type        = string
}

variable "vmss_priority" {
  description = "Optional) The Priority of this Virtual Machine Scale Set. Possible values are Regular and Spot. Defaults to Regular. Changing this value forces a new resource"
  type        = string
}

variable "vmss_provision_vm_agent" {
  description = "Should the Azure VM Agent be provisioned on each Virtual Machine in the Scale Set? Defaults to true. Changing this value forces a new resource to be created"
  type        = string
}

variable "vmss_proximity_placement_group_id" {
  description = "The ID of the Proximity Placement Group in which the Virtual Machine Scale Set should be assigned to. Changing this forces a new resource to be created"
  type        = string
}

variable "vmss_scale_in_policy" {
  description = "The scale-in policy rule that decides which virtual machines are chosen for removal when a Virtual Machine Scale Set is scaled in. Possible values for the scale-in policy rules are Default, NewestVM and OldestVM, defaults to Default"
  type        = string
}

variable "vmss_secure_boot_enabled" {
  description = "Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created"
  type        = string
}

variable "vmss_single_placement_group" {
  description = "Should this Virtual Machine Scale Set be limited to a Single Placement Group, which means the number of instances will be capped at 100 Virtual Machines"
  type        = string
}

variable "vmss_source_image_id" {
  description = "The ID of an Image which each Virtual Machine in this Scale Set should be based on"
  type        = string
}

variable "vmss_timezone" {
  description = "The timezome for vmss"
  type        = string
}

variable "vmss_upgrade_mode" {
  description = "Specifies the mode of an upgrade to virtual machines in the scale set. Possible values, Rolling, Manual, or Automatic. When choosing Rolling, you will need to set a health probe"
  type        = string
}

variable "vmss_vtpm_enabled" {
  description = "Specifies whether vTPM should be enabled on the virtual machine. Changing this forces a new resource to be created"
  type        = string
}

variable "vmss_zone_balance" {
  description = "Should the Virtual Machines in this Scale Set be strictly evenly distributed across Availability Zones? Defaults to false. Changing this forces a new resource to be created"
  type        = string
}

variable "vmss_zones" {
  description = "Specifies a list of Availability Zones in which this Linux Virtual Machine Scale Set should be located. Changing this forces a new Linux Virtual Machine Scale Set to be created"
  type        = set(string)
}

variable "vmss_disable_password_authentication" {
  description = "Specifies whether password authentication should be disabled. Defaults to false. Changing this forces a new resource to be created"
  type        = bool
}

variable "additional_capabilities" {
  type        = list(any)
  description = "A additional_capabilities"
}

variable "additional_unattend_content" {
  type        = list(any)
  description = "value"
}

variable "automatic_instance_repair" {
  type        = list(any)
  description = "To enable the automatic instance repair, this Virtual Machine Scale Set must have a valid health_probe_id or an Application Health Extension"
}

variable "automatic_os_upgrade_policy" {
  type        = list(any)
  description = " A automatic_os_upgrade_policy block as defined below. This can only be specified when upgrade_mode is set to Automatic"
}

variable "boot_diagnostics" {
  type        = list(any)
  description = "A boot_diagnostics"
}

variable "extension" {
  type        = list(any)
  description = "(Required) The name for the Virtual Machine Scale Set Extension"
}

variable "identity" {
  type        = list(any)
  description = "Specifies a list of user managed identity ids to be assigned to the VMSS. Required if type is UserAssigned"
}

variable "plan" {
  type        = list(any)
  description = " Specifies the name of the image from the marketplace"
}

variable "data_disk" {
  type        = list(any)
  description = "A storage profile data disk"
}

variable "rolling_upgrade_policy" {
  type        = list(any)
  description = ""
}

variable "secret" {
  type        = list(any)
  description = "Specifies a list of user managed identity ids to be assigned to the VMSS"
}

variable "certificate" {
  type        = list(any)
  description = "(Required, on windows machines) A collection of Vault Certificates"
}

variable "termination_notification" {
  type        = list(any)
  description = "A termination_notification "
}

variable "vmss_tags" {
  type        = map(string)
  description = "The tags used for resources"
}

variable "winrm_listener" {
  type        = list(any)
  description = "A collection of WinRM configuration"
}

variable "diff_disk_settings" {
  type        = list(any)
  description = ""
}

variable "ip_tag" {
  type        = list(any)
  description = "Tag of ip"
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
  description = "The name of network interface for vmss"
}

variable "ip_configuration" {
  type        = list(any)
  description = "The ip configuration name for network interface "
}


variable "vmss_source_image_reference_publisher" {
  description = "The publisher for vmss source image"
  type        = string
  # "Canonical" for Linux
}

variable "vmss_source_image_reference_offer" {
  description = "Specifies the offer of the image used to create the virtual machine. Changing this forces a new resource to be created. sku"
  type        = string
  # "UbuntuServer" for Linux
}

variable "vmss_source_image_reference_sku" {
  description = "The sku for vmss source image reference"
  type        = string
  # "16.04-LTS" for Linux
}

variable "vmss_source_image_reference_version" {
  description = "The version for vmms source image reference"
  type        = string
}

variable "vmss_os_disk_storage_account_type" {
  description = "The type of disk storage account"
  type        = string
}

variable "vmss_os_disk_caching" {
  description = "The type of os disk caching"
  type        = string
}

variable "vmss_os_disk_disk_encryption_set_id" {
  description = "The id of os disk encryption"
  type        = string
}

variable "vmss_os_disk_disk_size_gb" {
  description = "The disk size for vmss os in gb"
  type        = string
}

variable "vmss_os_disk_write_accelerator_enabled" {
  description = "Specifies if Write Accelerator is enabled on the disk. This can only be enabled on Premium_LRS managed disks with no caching and M-Series VMs. Defaults to false"
  type        = string
}

variable "vmss_os_disk_diff_disk_settings_option" {
  description = "value"
  type        = string
}

variable "vmss_network_interface_name" {
  description = "The name of network interface for vmss"
  type        = string
}

variable "vmss_network_interface_primary" {
  description = "The primary network interface for vmss"
  type        = bool
}

variable "vmss_network_interface_dns_servers" {
  description = " A list of IP Addresses defining the DNS Servers which should be used for this Network Interfac"
  type        = list(string)
}

variable "vmss_network_interface_enable_accelerated_networking" {
  description = " Should Accelerated Networking be enabled? Defaults to false"
  type        = string
}

variable "vmss_network_interface_enable_ip_forwarding" {
  description = "Should IP Forwarding be enabled? Defaults to false"
  type        = string
}

variable "vmss_network_interface_network_security_group_id" {
  description = "The security group id for vmss network interface"
  type        = string
}

variable "vmss_network_interface_ip_configuration_name" {
  description = "The ip configuration name for network interface"
  type        = string
}

variable "vmss_network_interface_ip_configuration_primary" {
  description = "The configuration of vmss network interface"
  type        = bool
}

variable "vmss_network_interface_ip_configuration_application_gateway_backend_address_pool_ids" {
  description = "value"
  type        = set(string)
}

variable "vmss_network_interface_ip_configuration_application_security_group_ids" {
  description = "The ID of vmss network interface ip configuration application gateway backend group"
  type        = set(string)
}

variable "vmss_network_interface_ip_configuration_load_balancer_backend_address_pool_ids" {
  description = "value"
  type        = set(string)
}

variable "vmss_network_interface_ip_configuration_load_balancer_inbound_nat_rules_ids" {
  description = "The ID of load balancer inbound nat rules"
  type        = set(string)
}

variable "vmss_network_interface_ip_configuration_version" {
  description = " The version of vmss network interface ip configuratio"
  type        = string
}

variable "vmss_network_interface_ip_configuration_public_ip_address_domain_name_label" {
  description = "The label of vmss network interface ip configuration public ip address domain name "
  type        = string
}

variable "vmss_network_interface_ip_configuration_public_ip_address_idle_timeout_in_minutes" {
  description = "value"
  type        = string
}

variable "vmss_network_interface_ip_configuration_public_ip_address_public_ip_prefix_id" {
  description = "The ID of vmss network interface ip configuration public ip address"
  type        = string
}

variable "vmss_network_interface_ip_configuration_public_ip_address_name" {
  description = "The name of vmss network interface ip configuration public ip address"
  type        = string
}

variable "public_key" {
  description = "The public key"
  type        = any
}

variable "os_flavor" {
  description = "The flavour of OS for vmss"
  type        = string
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
}
