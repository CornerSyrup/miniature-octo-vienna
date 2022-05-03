terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_network" "vlan" {
  name = "micro_vlan"
  ipam_config {
    subnet = "172.20.0.0/16"
  }
}

module "icecream" {
  source   = "../icecream"
  ext_port = 8080
  net_name = docker_network.vlan.name
  ip_addr  = "172.20.0.2"
}

module "order" {
  source   = "../order"
  ext_port = 8081
  net_name = docker_network.vlan.name
  ip_addr  = "172.20.0.3"
}

output "ip_icecream" {
  value = module.icecream.host_ip
}

output "ip_order" {
  value = module.order.host_ip
}
