# API token for Digital Ocean
variable do_token {
  sensitive = true
}

# Number of webservers that we want to deploy
variable webserver_count {
  default = 1
}
