#!/bin/bash

### Enable sudo without password.
sudo sed -i 's/^#\s*\(%wheel\s*ALL=(ALL)\s*NOPASSWD:\s*ALL\)/\1/' /etc/sudoers
sudo usermod -aG wheel "${USER}"

# Install ansible
sudo dnf -y install ansible

# Run Ansible
ansible-playbook main.yml --ask-become-user -e playbooks/default/main.yml