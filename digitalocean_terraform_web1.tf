resource "digitalocean_droplet" "jay-digitalocean-terraform-web-server-1" {
  image = "ubuntu-20-04-x64"
  name = "jay-digitalocean-terraform-web-server-1"
  region = "blr1"
  size = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    var.ssh_fingerprint
  ]
  connection {
    type = "ssh"
    host = self.ipv4_address
    user = "root"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }
}
