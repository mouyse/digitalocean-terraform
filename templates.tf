data "template_file" "haproxyconf" {
  template = file("${path.module}/config/haproxy.cfg.tpl")

  vars = {
    jay_digitalocean_terraform_web1_priv_ip = digitalocean_droplet.JayDOWebServer1.ipv4_address_private
    jay_digitalocean_terraform_web2_priv_ip = digitalocean_droplet.JayDOWebServer2.ipv4_address_private
  }
}
