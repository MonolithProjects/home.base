  variable system_env {
    default = "prod"
  }

  variable libvirt_hv1 {
    default = "qemu:///system"
  }

  variable "hv1_vm_prefix" {}
  variable "hv1_vm_count"    {}
  variable "hv1_index_start" {}
  variable "hv1_memory"      {}
  variable "hv1_vcpu"        {}
  variable "hv1_pool"        {}
  variable "hv1_system_volume" {}
  variable "hv1_dhcp"        {}
  variable "hv1_ip_address" {}
  variable "hv1_ip_gateway" {}
  variable "hv1_ip_nameserver" {}
  variable "hv1_local_admin" {}
  variable "hv1_ssh_admin"   {}
  variable "hv1_ssh_private_key" {}
  variable "hv1_local_admin_passwd" {}
  variable "hv1_ssh_keys"    {}
  variable "hv1_time_zone"   {}
  variable "hv1_os_img_url"  {}
  variable "hv1_bridge"  {}
  variable "hv1_xml_override" {}

  variable "hv1_support_vm_prefix" {}
  variable "hv1_support_vm_count"    {}
  variable "hv1_support_index_start" {}
  variable "hv1_support_memory"      {}
  variable "hv1_support_vcpu"        {}
  variable "hv1_support_pool"        {}
  variable "hv1_support_system_volume" {}
  variable "hv1_support_dhcp"        {}
  variable "hv1_support_ip_address" {}
  variable "hv1_support_ip_gateway" {}
  variable "hv1_support_ip_nameserver" {}
  variable "hv1_support_local_admin" {}
  variable "hv1_support_ssh_admin"   {}
  variable "hv1_support_ssh_private_key" {}
  variable "hv1_support_local_admin_passwd" {}
  variable "hv1_support_ssh_keys"    {}
  variable "hv1_support_time_zone"   {}
  variable "hv1_support_os_img_url"  {}
  variable "hv1_support_bridge"  {}
  variable "hv1_support_xml_override" {}

  variable "hv1_hassio_vm_prefix" {}
  variable "hv1_hassio_vm_count"    {}
  variable "hv1_hassio_index_start" {}
  variable "hv1_hassio_memory"      {}
  variable "hv1_hassio_vcpu"        {}
  variable "hv1_hassio_pool"        {}
  variable "hv1_hassio_system_volume" {}
  variable "hv1_hassio_dhcp"        {}
  variable "hv1_hassio_ip_address" {}
  variable "hv1_hassio_ip_gateway" {}
  variable "hv1_hassio_ip_nameserver" {}
  variable "hv1_hassio_local_admin" {}
  variable "hv1_hassio_ssh_admin"   {}
  variable "hv1_hassio_time_zone"   {}
  variable "hv1_hassio_os_img_url"  {}
  variable "hv1_hassio_bridge"  {}
  variable "hv1_hassio_xml_override" {}
