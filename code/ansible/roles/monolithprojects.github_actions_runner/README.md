# GitHub Actions Runner

[![awesome-runners](https://img.shields.io/badge/listed%20on-awesome--runners-blue.svg)](https://github.com/jonico/awesome-runners)
[![Galaxy Quality](https://img.shields.io/ansible/quality/47375?style=flat&logo=ansible)](https://galaxy.ansible.com/monolithprojects/github_actions_runner)
[![Role version](https://img.shields.io/github/v/release/MonolithProjects/ansible-github_actions_runner)](https://galaxy.ansible.com/monolithprojects/github_actions_runner)
[![Role downloads](https://img.shields.io/ansible/role/d/47375)](https://galaxy.ansible.com/monolithprojects/github_actions_runner)
[![GitHub Actions](https://github.com/MonolithProjects/ansible-github_actions_runner/workflows/molecule%20test/badge.svg?branch=master)](https://github.com/MonolithProjects/ansible-github_actions_runner/actions)
[![License](https://img.shields.io/github/license/MonolithProjects/ansible-github_actions_runner)](https://github.com/MonolithProjects/ansible-github_actions_runner/blob/main/LICENSE)


This role will deploy/redeploy/uninstall and register/unregister local GitHub Actions Runner.
It supports both, Organization and Repository Runners.

## Requirements

* System must have access to the GitHub.

* The role require Personal Access Token to access the GitHub. The token has to be a value of `PERSONAL_ACCESS_TOKEN` variable.
Export the token to the local host environment.

> **Note**  
> The token must have the `repo` scope (when creating a repo runner) or the `admin:org` scope (when creating a runner for an organization).
Personal Access Token for GitHub account can be created [here](https://github.com/settings/tokens).

> **Warning**  
> Never store you personal access token in the GitHub repository. Use [GitHub Secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) or some different secrets service.

* Runner user has to be pre-created.
  Recommended role: `monolithprojects.user_management`

* CentOS systems require EPEL repository.
  Recommended role: `robertdebock.epel`

## Supported CPU architecture:

* ARM, ARM64 (dependencies installation is not covered by this role)
* AMD64, x86_64
## Tested on:

* Debian 9,10,11
* Fedora 35
* Rocky Linux 8
* Ubuntu 18,20

  **Note:** Fedora 32+ and Ubuntu 20 must use Ansible 2.9.8+. Other distros/releases will work also with older 2.8.0+ Ansible.

## Role Variables

This is a copy from `defaults/main.yml`

```yaml
---
# Runner user - user under which is the local runner service running
runner_user: "{{ lookup('env','USER') }}"

# Directory where the local runner will be installed
runner_dir: /opt/actions-runner

# Version of the GitHub Actions Runner
runner_version: "latest"

# State in which the runner service will be after the role is done (started, stopped, absent)
runner_state: "started"

# If found on the server, delete already existing runner service and install it again
reinstall_runner: no

# Do not show Ansible logs which may contain sensitive data (registration token)
hide_sensitive_logs: yes

# GitHub address
github_url: "https://github.com"

# GitHub API
github_api_url: "https://api.github.com"

# Personal Access Token for your GitHub account
access_token: "{{ lookup('env', 'PERSONAL_ACCESS_TOKEN') }}"

# Is it the runner for organization or not?
runner_org: no

# Labels to apply to the runner
runner_labels: []

# Group to add organization runner to
runner_group: ""

# GitHub Actions Runner repository (change it if you want to use custom Actions Runner fork)
runner_download_repository: "actions/runner"

# Extra arguments to pass to `config.sh`.
# Several arguments muste be set as one string (i.e. "--ephemeral --my_special_fork")
runner_extra_config_args: ""

# Name to assign to this runner in GitHub (System hostname as default)
runner_name: "{{ ansible_hostname }}"

# Custom service name when using Github Enterprise server
# DEPRECATED: this variable is deprecated in favor of "runner_on_ghes" and will be removed in release 1.15.
# service_name: actions.runner._services.{{ runner_name }}.service

# GitHub Repository user or Organization owner used for Runner registration
# github_account: "youruser"

# GitHub repository owner name (if other than github_account)
# github_owner: "yourorg"

# Github repository name
# github_repo: "yourrepo"

# Configuring a custom .env file
# custom_env: |
# http_proxy=YOUR_URL_HERE
# ftp_proxy=YOUR_URL_HERE
# HTTPS_PROXY=YOUR_URL_HERE
# https_proxy=YOUR_URL_HERE
# no_proxy=localhost,127.0.0.1,127.0.0.2
# HTTP_PROXY=
```

## Example Playbook

In this example the Ansible role will install (or update) the GitHub Actions Runner service (latest available version). The runner will be registered for *my_awesome_repo* GitHub repo.
Runner service will be stated and will run under the same user as the Ansible is using for ssh connection (*ansible*).

```yaml
---
- name: Install GitHub Actions Runner
  hosts: all
  user: ansible
  become: yes
  vars:
    - github_account: github-access-user
    - github_repo: my_awesome_repo
  roles:
    - role: monolithprojects.github_actions_runner
```

Same example as above, but runner will be added to an organization and deployed on GitHub Enterprise Server.

```yaml
---
- name: Install GitHub Actions Runner
  hosts: all
  user: ansible
  become: yes
  vars:
    - github_account: my_awesome_org
    - runner_org: yes
    - runner_on_ghes: yes
  roles:
    - role: monolithprojects.github_actions_runner
```

In this example the Ansible role will deploy (or update) the GitHub Actions runner service (version 2.165.2) and register the runner for the GitHub repo. Runner service will run under the user `runner-user`. Runner will be registered with two labels.
The runner service will be *stopped* and disabled. Runner will use custom environment variables (from file named `.env` in the self-hosted runner application directory).

```yaml
---
- name: Stop GitHub Actions Runner
  hosts: all
  become: yes
  vars:
    - runner_version: "2.165.2"
    - runner_user: runner-user
    - github_account: github-access-user
    - github_repo: my_awesome_repo
    - runner_state: "stopped"
    - runner_labels:
        - production
        - west
    - custom_env: |
        HTTP_PROXY=http://proxy.local:8080
        http_proxy=http://proxy.local:8080
        HTTPS_PROXY=http://proxy.local:8080
        https_proxy=http://proxy.local:8080
        no_proxy=localhost,127.0.0.1,127.0.0.2

  roles:
    - role: monolithprojects.github_actions_runner
```

In this example the Ansible role will uninstall the runner service and unregister it from the GitHub Repository.

```yaml
---
- name: Uninstall GitHub Actions Runner
  hosts: all
  become: yes
  vars:
    - github_account: github-access-user
    - github_repo: my_awesome_repo
    - runner_state: "absent"
  roles:
    - role: monolithprojects.github_actions_runner
```

## License

MIT

## Author Information

Created in 2020 by Michal Muransky
