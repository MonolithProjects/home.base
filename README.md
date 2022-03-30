# My Home system - Base

This repo contains the IaC for my home system. It's based on KVM/libvirt VM(s). Applications are running in containers using the Docker runtime (for now). Application stacks (docker-compose) are being synchronized with git repository (home.apps) using Portainer.

## What's behind this

I tried to create an infrastructure for my home system to be as simple as possible. Before i endedup with this simple design i was elaborating RKE2, K3s and Nomad... but since at work i am managing large K8s sclusters, to have a complex cluster also at home was my last intention :)

## How it works

The IaC is located in the `code` directory. Most likely you will not need to touch it. On the other and, the directory `env` contains the various environments where you want to deploy this system. The content looks like this:

```sh
├── example               <<< # the name of the environment
│   ├── group_vars        <<< # group wars dir
│   │   └── all.yml       <<< # group wars file for all nodes
│   ├── hosts.ini         <<< # ansible inventory file (will be generated during the run)
│   └── terraform.tfvars  <<< # terraform variables
```

To deploy the system, run:

```sh
ansible-playbook -i env/dev-local/hosts.ini site.yml
```

To destroy the system, run:

```sh
ansible-playbook -i env/dev-local/hosts.ini site.yml --extra-vars "deployment=absent"
```

## Design

![](./architecture.png)


### Compute nodes

- Mini PCs
  - Prod - 4xCPU Intel i3, 8 GB RAM, 120GB SSD, 4TB external HDD, 60GB USB flash drive
  - Dev - 2xCPU Pentium-D, 8 GB RAM, 120GB SSD
- Ubuntu 20.04 TLS
- KVM/libvirt 4.0.0

## Deployment workflow

![](./workflow.png)

## TO DO list

- Automated backup of Home Assistant and Portainer config
- vSupport VM
- Use the second compute node for dev environment
- CI/CD using Github Actions