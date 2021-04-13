variable "jay_digitalocean_terraform_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}
provider "digitalocean" {
  token = var.jay_digitalocean_terraform_token
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}
