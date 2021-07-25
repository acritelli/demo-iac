resource "digitalocean_droplet" "demo-webservers" {
    count    = var.webserver_count
    image    = "ubuntu-20-04-x64"
    name     = "webserver-${count.index}"
    region   = "nyc3"
    size     = "s-1vcpu-1gb"
    tags     = ["demo-webservers"]
    ssh_keys = [
      data.digitalocean_ssh_key.personal_ssh_key.fingerprint,
      data.digitalocean_ssh_key.github_ssh_key.fingerprint
      ]

    provisioner "local-exec" {
      command = "echo ${self.name} ${self.ipv4_address} >> /tmp/do_ips"
    }
}

resource "digitalocean_firewall" "demo-web-firewall" {
  name = "demo-webserver-firewall"

  droplet_ids = digitalocean_droplet.demo-webservers[*].id

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["${digitalocean_droplet.demo-loadbalancer.ipv4_address}/32"]
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
