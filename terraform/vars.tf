# List of IPs that can SSH to servers
variable ssh_ips {}

# API token for Digital Ocean
variable do_token {}

# AWS Credentials
variable aws_access_key_id {}
variable aws_secret_access_key {}

# Number of webservers that we want to deploy
variable webserver_count {
  default = 1
}
