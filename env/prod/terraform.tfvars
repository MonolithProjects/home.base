# Environment name
system_env        = "prod"

# Libvirt KVM Compute node
libvirt_hv1       = "qemu+ssh://hvadmin@192.168.160.201/system?keyfile=/home/mike/.ssh/id_ed25519_mono_010521&no_verify=1"

# vServer name prefix
hv1_vm_prefix     = "hv1-vserver"

# vServer count
hv1_vm_count      = 1

hv1_index_start   = 1
hv1_memory        = "3584"
hv1_vcpu          = 3
hv1_pool          = "storage_pool"
hv1_system_volume = 30
hv1_dhcp          = false
hv1_ip_address    = ["192.168.160.101"]
hv1_ip_gateway    = "192.168.160.254"
hv1_ip_nameserver = "192.168.160.254"
hv1_local_admin   = "localadmin"
hv1_ssh_admin     = "sshadmin"
hv1_time_zone     = "CET"
hv1_os_img_url    = "file:///home/mike/Documents/images/ubuntu-20.04-server-cloudimg-amd64.img"
hv1_bridge        = "br0"

hv1_xml_override = {
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
hv1_support_memory        = "1536"
hv1_support_vcpu          = 2
hv1_support_pool          = "storage_pool"
hv1_support_system_volume = 10
hv1_support_dhcp          = false
hv1_support_ip_address    = ["192.168.160.111", "192.168.160.112"]
hv1_support_ip_gateway    = "192.168.160.254"
hv1_support_ip_nameserver = "192.168.160.254"
hv1_support_local_admin   = "localadmin"
hv1_support_ssh_admin     = "sshadmin"
hv1_support_time_zone     = "CET"
hv1_support_os_img_url    = "file:///home/mike/Documents/images/ubuntu-20.04-server-cloudimg-amd64.img"
hv1_support_bridge        = "br0"

hv1_support_xml_override = {
      hugepages = true,
      usb_controllers = [
        {
          model = "qemu-xhci"
        }
      ],
      usb_devices = [
        { 
          vendor = "0x090c",
          product = "0x1000"
        }
      ]
    }

hv1_hassio_vm_prefix     = "hv1-hassio"

# vServer count
hv1_hassio_vm_count      = 1

hv1_hassio_index_start   = 1
hv1_hassio_memory        = "2048"
hv1_hassio_vcpu          = 3
hv1_hassio_pool          = "storage_pool"
hv1_hassio_system_volume = 20
hv1_hassio_dhcp          = false
hv1_hassio_ip_address    = ["192.168.160.102"]
hv1_hassio_ip_gateway    = "192.168.160.254"
hv1_hassio_ip_nameserver = "192.168.160.254"
hv1_hassio_local_admin   = "localadmin"
hv1_hassio_ssh_admin     = "sshadmin"
hv1_hassio_time_zone     = "CET"
hv1_hassio_os_img_url    = "file:///home/mike/Documents/images/debian-11-generic-amd64-20210814-734.img"
hv1_hassio_bridge        = "br0"

hv1_hassio_xml_override = {
      hugepages = true,
      usb_controllers = [
        {
          model = "qemu-xhci"
        }
      ],
      usb_devices = [
        { 
          vendor = "0x0451",
          product = "0x16a8"
        }
      ]
    }