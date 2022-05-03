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
  default     = 8081
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

resource "docker_image" "order" {
  name = "order"
  build {
    path = "../order"
  }
  keep_locally = false
}

resource "docker_container" "order" {
  name  = "order_endpoint"
  image = docker_image.order.name
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
  value       = docker_container.order.ip_address
}
