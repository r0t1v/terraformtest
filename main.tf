terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.23.0"
    }
  }
}

provider "digitalocean" {

}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
}

variable "do_token" {
  default = ""
}
variable "ssh_key_name" {
  default = ""
}
variable "region" {
  default = ""
}

data "digitalocean_droplet" "example" {
  name = "web"
}

output "droplet_output" {
  value = data.digitalocean_droplet.example.ipv4_address
}

resource "local_file" "foo" {
  content  = ""
  filename = "kube_confi.yaml"
}