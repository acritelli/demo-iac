# List of IPs that can SSH to servers
variable ssh_ips {
}

# API token for Digital Ocean
variable do_token {
  sensitive = true
}

# AWS Credentials
variable aws_access_key_id {
  sensitive = true
}
variable aws_secret_access_key {
  sensitive = true
}

# Number of webservers that we want to deploy
variable webserver_count {
  default = 1
}
