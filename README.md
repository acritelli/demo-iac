# `demo-iac`

This repository contains code for a demo of infrastructure and configuration as code.

At a high level:

* `.github` - GitHub actions for creating and destroying the infrastructure
* `ansible` - Deploys and configures software on load balancers and web servers
* `scripts` - Scripts used by GitHub actions
* `terraform` - Deploys infrastructure (DigitalOcean for servers and firewalling, AWS for DNS)

When you're done, loadbalancer.demo.acritelli.com will be front-ending a website:

![Deployed Website](doc/img/website.png)

## Credits

Credit to the [geo-bootstrap](https://github.com/divshot/geo-bootstrap) project for the website template itself.
