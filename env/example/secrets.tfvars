# Terraform secrets
# DONT FORGET TO ENCRYPT BEFORE YOU PUSH IT TO VCS (ansible-vault encrypt secrets.tfvars backend.hcl)

# Path to ssh private key
hv1_ssh_private_key    = "~/.ssh/home_system_ed25519"

# Local Admin Password hash to be set on vServer (mkpasswd --method=SHA-512 --rounds=4096) 
hv1_local_admin_passwd = "$6$rounds=4096$HASHED_PASSWORD"

# SSH Public Key to be deployed on vServer
hv1_ssh_keys           = ["ssh PUBLIC KEY...",]
