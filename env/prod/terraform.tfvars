# Environment name
system_env        = "prod"

# Libvirt KVM Compute node
libvirt_hv1       = "qemu+ssh://hvadmin@192.168.160.201/system?keyfile=/home/mike/.ssh/id_ed25519_mono_010521&no_verify=1"

# vServer name prefix
hv1_vm_prefix     = "hv1-vserver"

# vServer count
hv1_vm_count      = 1

hv1_index_start   = 1
hv1_memory        = "6144"
# hv1_hugepages     = true
hv1_vcpu          = 3
hv1_pool          = "storage_pool"
hv1_system_volume = 70
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
        },
        { 
          vendor = "0x090c",
          product = "0x1000"
        },
        { 
          vendor = "0x0451",
          product = "0x16a8"
        }
      ]
    }