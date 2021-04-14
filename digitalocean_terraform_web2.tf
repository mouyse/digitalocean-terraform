resource "digitalocean_droplet" "JayDOWebServer2" {
  image              = "ubuntu-20-04-x64"
  name               = "JayDOWebServer2"
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
}
