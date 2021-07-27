resource "aws_route53_record" "webserver-dns" {
  count = var.webserver_count
  zone_id = data.aws_route53_zone.demo-acritelli-com-zone.zone_id
  name    = "${digitalocean_droplet.demo-webservers[count.index].name}.demo.acritelli.com"
  type    = "A"
  ttl     = "60"
  records = [digitalocean_droplet.demo-webservers[count.index].ipv4_address]
}

resource "aws_route53_record" "loadbalancer-dns" {
  zone_id = data.aws_route53_zone.demo-acritelli-com-zone.zone_id
  name    = "${digitalocean_droplet.demo-loadbalancer.name}.demo.acritelli.com"
  type    = "A"
  ttl     = "60"
  records = [digitalocean_droplet.demo-loadbalancer.ipv4_address]
}

resource "aws_route53_record" "website-cname" {
  zone_id = data.aws_route53_zone.demo-acritelli-com-zone.zone_id
  name    = "www.demo.acritelli.com"
  type    = "CNAME"
  ttl     = "60"
  records = ["loadbalancer.demo.acritelli.com"]
}
