data "digitalocean_ssh_key" "personal_ssh_key" {
  name = "laptop-fedora"
}

data "digitalocean_ssh_key" "github_ssh_key" {
  name = "gh-actions"
}

data "aws_route53_zone" "demo-acritelli-com-zone" {
  name         = "demo.acritelli.com."
}
