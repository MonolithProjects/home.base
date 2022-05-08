# Environment name
system_env        = "dev-local"

# Libvirt KVM Compute node
libvirt_hv1       = "qemu:///system"

# vServer name prefix
hv1_vm_prefix     = "hv1-vserver"

# vServer count
hv1_vm_count      = 1

hv1_index_start   = 1
hv1_memory        = "2048"
hv1_vcpu          = 2
hv1_pool          = "host1"
hv1_system_volume = 20
hv1_dhcp          = false
hv1_ip_address    = ["192.168.122.101"]
hv1_ip_gateway    = "192.168.122.1"
hv1_ip_nameserver = "192.168.122.1"
hv1_local_admin   = "localuser"
hv1_ssh_admin     = "admin"
hv1_time_zone     = "CET"
hv1_os_img_url    = "file:///path_to/ubuntu-20.04-server-cloudimg-amd64.img"
hv1_bridge        = "default"

hv1_xml_override  = {
      hugepages = true,
      usb_controllers = [
        {
          model = "qemu-xhci"
        }
      ],
      usb_devices = [
        { 
          vendor = "0x0bc2",
          product = "0xab28"
        }
      ]
    }

hv1_support_vm_prefix     = "hv1-vsupport"
hv1_support_vm_count      = 1
hv1_support_index_start   = 1
hv1_support_memory        = "1048"
hv1_support_vcpu          = 2
hv1_support_pool          = "host1"
hv1_support_system_volume = 20
hv1_support_dhcp          = false
hv1_support_ip_address    = ["192.168.122.111"]
hv1_support_ip_gateway    = "192.168.122.1"
hv1_support_ip_nameserver = "192.168.122.1"
hv1_support_local_admin   = "localadmin"
hv1_support_ssh_admin     = "sshadmin"
hv1_support_time_zone     = "CET"
hv1_support_os_img_url    = "file:///path_to/ubuntu-20.04-server-cloudimg-amd64.img"
hv1_support_bridge        = "default"

hv1_support_xml_override = {
      hugepages = false,
      usb_controllers = [
        {
          model = "qemu-xhci"
        }
      ],
      usb_devices = []
    }
