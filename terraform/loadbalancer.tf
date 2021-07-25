resource "digitalocean_droplet" "demo-loadbalancer" {
    image    = "ubuntu-18-04-x64"
    name     = "loadbalancer"
    region   = "nyc3"
    size     = "s-1vcpu-1gb"
    tags     = ["demo-loadbalancers"]
    ssh_keys = [
      data.digitalocean_ssh_key.personal_ssh_key.fingerprint,
      data.digitalocean_ssh_key.github_ssh_key.fingerprint
      ]
}

resource "digitalocean_firewall" "demo-loadbalaner-firewall" {
  name = "demo-loadbalancer-firewall"

  droplet_ids = [
    digitalocean_droplet.demo-loadbalancer.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = var.ssh_ips
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
    port_range            = "1-65535"
  }

  outbound_rule {
    protocol              = "udp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
    port_range            = "1-65535"

  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
    port_range            = "1-65535"
  }
}
