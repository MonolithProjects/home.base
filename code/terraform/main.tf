terraform {
  required_version = ">= 0.13"
    required_providers {
      libvirt = {
        source  = "dmacvicar/libvirt"
        version = "0.6.14"
      }
    }
  backend "remote" {}
}

provider "libvirt" {
  alias = "hv1"
  uri = var.libvirt_hv1
}

module "vservers_hv1" {
  providers = {
    libvirt = libvirt.hv1
  }
  # source      = "../../../terraform-libvirt-vm"
  source  = "MonolithProjects/vm/libvirt"
  version = "1.9.1"

  vm_hostname_prefix = var.hv1_vm_prefix
  vm_count    = var.hv1_vm_count
  index_start = var.hv1_index_start
  memory      = var.hv1_memory
  xml_override = var.hv1_xml_override
  vcpu        = var.hv1_vcpu
  pool        = var.hv1_pool
  system_volume = var.hv1_system_volume
  bridge      = var.hv1_bridge
  dhcp        = var.hv1_dhcp
  ip_address  = var.hv1_ip_address
  ip_gateway  = var.hv1_ip_gateway
  ip_nameserver = var.hv1_ip_nameserver
  local_admin = var.hv1_local_admin
  ssh_admin   = var.hv1_ssh_admin
  ssh_private_key = var.hv1_ssh_private_key
  local_admin_passwd = var.hv1_local_admin_passwd
  ssh_keys    = var.hv1_ssh_keys
  time_zone   = var.hv1_time_zone
  os_img_url  = var.hv1_os_img_url
}

module "vsupport_hv1" {
  providers = {
    libvirt = libvirt.hv1
  }
  # source      = "../../../terraform-libvirt-vm"
  source  = "MonolithProjects/vm/libvirt"
  version = "1.9.1"

  vm_hostname_prefix = var.hv1_support_vm_prefix
  vm_count    = var.hv1_support_vm_count
  index_start = var.hv1_support_index_start
  memory      = var.hv1_support_memory
  xml_override = var.hv1_support_xml_override
  vcpu        = var.hv1_support_vcpu
  pool        = var.hv1_support_pool
  system_volume = var.hv1_support_system_volume
  bridge      = var.hv1_support_bridge
  dhcp        = var.hv1_support_dhcp
  ip_address  = var.hv1_support_ip_address
  ip_gateway  = var.hv1_support_ip_gateway
  ip_nameserver = var.hv1_support_ip_nameserver
  local_admin = var.hv1_support_local_admin
  ssh_admin   = var.hv1_support_ssh_admin
  ssh_private_key = var.hv1_support_ssh_private_key
  local_admin_passwd = var.hv1_support_local_admin_passwd
  ssh_keys    = var.hv1_support_ssh_keys
  time_zone   = var.hv1_support_time_zone
  os_img_url  = var.hv1_support_os_img_url
}

#### Ansible Inventory ####

data "template_file" "hv1_server" {
  count = var.hv1_vm_count
  template = file("templates/cluster_temp.tpl")
  vars = {
    "vm_name" = element(module.vservers_hv1.name, count.index + 1)
    "ip_address" = element(module.vservers_hv1.ip_address, count.index + 1)
    "ssh_private_key" = var.hv1_ssh_private_key
    }
}

data "template_file" "hv1_support" {
  count = var.hv1_vm_count
  template = file("templates/cluster_temp.tpl")
  vars = {
    "vm_name" = element(module.vsupport_hv1.name, count.index + 1)
    "ip_address" = element(module.vsupport_hv1.ip_address, count.index + 1)
    "ssh_private_key" = var.hv1_ssh_private_key
    }
}

data "template_file" "ansible_inventory" {
  template = file("templates/inventory.tpl")
  vars = {
    vservers_hv1 = join( "\n", data.template_file.hv1_server.*.rendered)
    vsupport_hv1 = join( "\n", data.template_file.hv1_support.*.rendered)
  }
}

resource "local_file" "ansible_inventory" {
    content = data.template_file.ansible_inventory.rendered
    filename = "../../env/${var.system_env}/hosts.ini"
}

### Outputs ###

output "outputs" {
  value = data.template_file.ansible_inventory.rendered
}