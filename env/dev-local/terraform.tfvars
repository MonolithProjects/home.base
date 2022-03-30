system_env        = "dev-local"

libvirt_hv1       = "qemu:///system"

hv1_vm_prefix     = "hv1-vserver"
hv1_vm_count      = 1
hv1_index_start   = 1
hv1_memory        = "2048"
hv1_hugepages     = false
hv1_vcpu          = 2
hv1_pool          = "host1"
hv1_system_volume = 20
hv1_dhcp          = false
hv1_ip_address    = [ 
    "192.168.122.161",
    "192.168.122.162",
    "192.168.122.163"
  ]
hv1_ip_gateway    = "192.168.122.1"
hv1_ip_nameserver = "192.168.122.1"
hv1_local_admin   = "localadmin"
hv1_ssh_admin     = "sshadmin"
hv1_time_zone     = "CET"
hv1_os_img_url    = "file:///home/mike/Documents/images/ubuntu-20.04-server-cloudimg-amd64.img"
hv1_bridge        = "virbr0"

hv1_xml_override = {
      hugepages = true,
      usb_controllers = [
        {
          model = "qemu-xhci"
        }
      ],
      usb_devices = []
    }