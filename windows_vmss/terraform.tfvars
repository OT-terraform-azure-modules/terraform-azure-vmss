resource_group_name     = "rg-himanshu"
location                = "Australia East"
vnet_name               = "example-network"
vnet_address_space      = ["10.0.0.0/16"]
subnet_name             = "subnet-01"
subnet_address_prefixes = ["10.0.2.0/24"]
vmss_name               = "example-vmss"
vmss_sku                = "Standard_D2s_v3"
vmss_instances          = 1
os_flavor               = "Windows"
vmss_admin_username     = "Opstree"

# ### For Linux
# source_image_reference = {
#       publisher = "Canonical"
#       offer     = "UbuntuServer"
#       sku       = "16.04-LTS"
#       version   = "Latest"
#     }


## For Windows
source_image_reference = {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2016-Datacenter-Server-Core"
  version   = "Latest"
}
os_disk = {
  storage_account_type      = "Standard_LRS"
  caching                   = "ReadWrite"
  disk_encryption_set_id    = null
  disk_size_gb              = null
  write_accelerator_enabled = null
}
network_interface = {
  name                          = "example"
  primary                       = true
  dns_servers                   = null
  enable_accelerated_networking = null
  enable_ip_forwarding          = null
  network_security_group_id     = null
  ip_configuration = {
    name                                         = "internal"
    primary                                      = true
    subnet_id                                    = null
    application_gateway_backend_address_pool_ids = null
    application_security_group_ids               = null
    load_balancer_backend_address_pool_ids       = null
    load_balancer_inbound_nat_rules_ids          = null
    version                                      = null
    public_ip_address = {
      domain_name_label       = null
      idle_timeout_in_minutes = null
      public_ip_prefix_id     = null
      name                    = "ppip"
      ip_tag                  = {}
    }
  }
}
ip_configuration            = []
additional_capabilities     = []
additional_unattend_content = []
automatic_instance_repair   = []
automatic_os_upgrade_policy = []
boot_diagnostics            = []
extension                   = []
identity                    = []
plan                        = []
data_disk                   = []
rolling_upgrade_policy      = []
secret                      = []
certificate                 = []
termination_notification    = []
vmss_tags                   = null
winrm_listener              = []
diff_disk_settings          = []
ip_tag                      = []