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

variable "ext_port" {
  default     = 8080
  description = "External port for the contianer"
  type        = number
}

variable "net_name" {
  default     = ""
  description = "Docker virtual network name"
  type        = string
}

variable "ip_addr" {
  description = "IPv4 address for the container"
  type        = string
}

resource "docker_image" "icecream" {
  name = "icecream"
  build {
    path = "../icecream"
  }
  keep_locally = false
}

resource "docker_container" "icecream" {
  name  = "icecream_endpoint"
  image = docker_image.icecream.name
  ports {
    internal = 80
    external = var.ext_port
  }
  networks_advanced {
    name         = var.net_name
    ipv4_address = var.ip_addr
  }
}

output "host_ip" {
  description = "IP address of the container"
  value       = docker_container.icecream.ip_address
}
