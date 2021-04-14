resource "digitalocean_droplet" "haproxy-web" {
  image              = "ubuntu-20-04-x64"
  name               = "haproxy-web"
  region             = "blr1"
  size               = "s-1vcpu-1gb"
  private_networking = true
  user_data          = file("config/webuserdata.sh")
  ssh_keys = [
    var.ssh_fingerprint
  ]
  connection {
    type        = "ssh"
    host        = self.ipv4_address
    user        = "root"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 25",
      "sudo apt-get update",
      "sudo apt-get -y install haproxy"
    ]
  }
  provisioner "file" {
    content     = data.template_file.haproxyconf.rendered
    destination = "/etc/haproxy/haproxy.cfg"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo service haproxy restart"
    ]
  }
}
