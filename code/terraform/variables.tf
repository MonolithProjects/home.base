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