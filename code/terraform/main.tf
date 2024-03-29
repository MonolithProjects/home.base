terraform {
  required_version = ">= 0.13"
    required_providers {
      libvirt = {
        source  = "dmacvicar/libvirt"
        version = "0.7.1"
      }
    }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "monolithprojects"

    workspaces {
      prefix = "home-"
    }
  }
}

provider "libvirt" {
  alias = "hv1"
  uri = var.libvirt_hv1
}

provider "libvirt" {
  alias = "hv2"
  uri = var.libvirt_hv2
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

module "hassio_hv1" {
  providers = {
    libvirt = libvirt.hv1
  }
  # source      = "../../../terraform-libvirt-vm"
  source  = "MonolithProjects/vm/libvirt"
  version = "1.9.1"

  vm_hostname_prefix = var.hv1_hassio_vm_prefix
  vm_count    = var.hv1_hassio_vm_count
  index_start = var.hv1_hassio_index_start
  memory      = var.hv1_hassio_memory
  xml_override = var.hv1_hassio_xml_override
  vcpu        = var.hv1_hassio_vcpu
  pool        = var.hv1_hassio_pool
  system_volume = var.hv1_hassio_system_volume
  bridge      = var.hv1_hassio_bridge
  dhcp        = var.hv1_hassio_dhcp
  ip_address  = var.hv1_hassio_ip_address
  ip_gateway  = var.hv1_hassio_ip_gateway
  ip_nameserver = var.hv1_hassio_ip_nameserver
  local_admin = var.hv1_hassio_local_admin
  ssh_admin   = var.hv1_hassio_ssh_admin
  ssh_private_key = var.hv1_ssh_private_key
  local_admin_passwd = var.hv1_local_admin_passwd
  ssh_keys    = var.hv1_ssh_keys
  time_zone   = var.hv1_hassio_time_zone
  os_img_url  = var.hv1_hassio_os_img_url
}

module "vrunners_hv2" {
  providers = {
    libvirt = libvirt.hv2
  }
  source  = "MonolithProjects/vm/libvirt"
  version = "1.9.1"

  vm_hostname_prefix = var.hv2_vm_prefix
  vm_count    = var.hv2_vm_count
  index_start = var.hv2_index_start
  memory      = var.hv2_memory
  xml_override = var.hv2_xml_override
  vcpu        = var.hv2_vcpu
  pool        = var.hv2_pool
  system_volume = var.hv2_system_volume
  bridge      = var.hv2_bridge
  dhcp        = var.hv2_dhcp
  ip_address  = var.hv2_ip_address
  ip_gateway  = var.hv2_ip_gateway
  ip_nameserver = var.hv2_ip_nameserver
  local_admin = var.hv2_local_admin
  ssh_admin   = var.hv2_ssh_admin
  ssh_private_key = var.hv1_ssh_private_key
  local_admin_passwd = var.hv1_local_admin_passwd
  ssh_keys    = var.hv1_ssh_keys
  time_zone   = var.hv2_time_zone
  os_img_url  = var.hv2_os_img_url
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
    "ssh_private_key" = var.hv1_support_ssh_private_key
    }
}

data "template_file" "hv1_hassio" {
  count = var.hv1_vm_count
  template = file("templates/cluster_temp.tpl")
  vars = {
    "vm_name" = element(module.hassio_hv1.name, count.index + 1)
    "ip_address" = element(module.hassio_hv1.ip_address, count.index + 1)
    "ssh_private_key" = var.hv1_ssh_private_key
    }
}

data "template_file" "hv2_runner" {
  count = var.hv2_vm_count
  template = file("templates/cluster_temp.tpl")
  vars = {
    "vm_name" = element(module.vrunners_hv2.name, count.index + 1)
    "ip_address" = element(module.vrunners_hv2.ip_address, count.index + 1)
    "ssh_private_key" = var.hv1_ssh_private_key
    }
}

data "template_file" "ansible_inventory" {
  template = file("templates/inventory.tpl")
  vars = {
    vservers_hv1 = join( "\n", data.template_file.hv1_server.*.rendered)
    vsupport_hv1 = join( "\n", data.template_file.hv1_support.*.rendered)
    hassio_hv1 = join( "\n", data.template_file.hv1_hassio.*.rendered)
    vrunners_hv2 = join( "\n", data.template_file.hv2_runner.*.rendered)
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