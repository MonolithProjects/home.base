# Home Assistant Supervisor compliance

[![Galaxy Quality](https://img.shields.io/ansible/quality/61013?style=flat&logo=ansible)](https://galaxy.ansible.com/monolithprojects/homeassistant_compliance)
[![Role version](https://img.shields.io/github/v/release/MonolithProjects/ansible-homeassistant_compliance)](https://galaxy.ansible.com/monolithprojects/homeassistant_compliance)
[![Role downloads](https://img.shields.io/ansible/role/d/61013)](https://galaxy.ansible.com/monolithprojects/homeassistant_compliance)
[![GitHub Actions](https://github.com/MonolithProjects/ansible-homeassistant_compliance/workflows/molecule%20test/badge.svg?branch=master)](https://github.com/MonolithProjects/ansible-homeassistant_compliance/actions)
[![License](https://img.shields.io/github/license/MonolithProjects/ansible-homeassistant_compliance)](https://github.com/MonolithProjects/ansible-homeassistant_compliance/blob/main/LICENSE)

This role will make Debian 11 Operating System compliant with [Home Assistant](https://www.home-assistant.io/) Supervisor. It will fix all OS related `Unsupported system` warning messages coming from Home Assistant Supervisor.

## Requirements

* Operating System: Debian 11  
  (Beside the `Home Assistant OS` Home Assistant team officialy support only `Debian 11 (bullseye)` to run the Supervisor. More [here](https://www.home-assistant.io/more-info/unsupported/os/))

* Run this role with root privilege (`become: true`)

* This role will NOT install the `Docker-CE`. Therefore you need to resolve it prior running this Ansible role. I recommend to user Ansible role `geerlingguy.docker`.

## Tested on

* Debian 11

## Role Variables

This is a copy of `defaults/main.yml`

```yaml
---
# Enable Apparmor
ha_fix_apparmor: yes

# Install and enable DBUS
ha_fix_dbus: yes

# If Docker is older than minimal supported version, update to latest
ha_fix_docker: yes
ha_fix_docker_minimal: 20.10.17

# Uninstall LXC
ha_fix_lxc: yes

# Install Home Assistant OS Agent
ha_fix_osagent: yes
ha_fix_osagent_cpu_architecture: x86_64
ha_fix_osagent_download_repository: "home-assistant/os-agent"
ha_fix_osagent_version: latest

# Install and enable systemd-journal-remote
ha_fix_systemd_journal: yes

# Enable systemd-resolved
ha_fix_systemd_resolved: yes

# Revert CGroup to version 1
ha_fix_cgroup: yes

# Install and enable Network Manager
ha_fix_network_manager: yes

# Use following network config files when fixing Network Manager
# /etc/network/interfaces
ha_fix_network_manager_interfaces: |
  # This file is managed by Ansible

  source-directory /run/network/interfaces.d

  auto lo
  iface lo inet loopback

# /etc/NetworkManager/system-connections/default
ha_fix_network_manager_default: |
  # This file is managed by Ansible

  [connection]
  id=Supervisor default
  uuid=1c8d78bf-e4e0-4735-8dca-eb31635dba30
  type=802-3-ethernet
  llmnr=2
  mdns=2

  [ipv4]
  method=auto

  [ipv6]
  addr-gen-mode=stable-privacy
  method=auto

# /etc/NetworkManager/NetworkManager.conf
ha_fix_network_manager_conf: |
  # This file is managed by Ansible

  [main]
  dns=default
  plugins=keyfile
  autoconnect-retries-default=0
  rc-manager=file

  [keyfile]
  unmanaged-devices=type:bridge;type:tun;driver:veth

  [logging]
  backend=journal
```

## Example Playbook

This Playbook will install Docker-CE and fix Home Assistant system warnings.

```yaml
---
- name: Fix Home Assistant warnings
  hosts: homeassistant
  become: true
  roles:
    - role: geerlingguy.docker
    - role: monolithprojects.homeassistant_compliance
```

## License

MIT

## Author Information

Created in 2022 by Michal Muransky
