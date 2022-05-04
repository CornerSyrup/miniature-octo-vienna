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
  default     = 80
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

resource "docker_image" "nginx" {
  name = "nginx:1.21.6-alpine"
}

resource "docker_container" "gateway" {
  image = docker_image.nginx.name
  name  = "api_gateway"
  ports {
    internal = 80
    external = var.ext_port
  }
  networks_advanced {
    name         = var.net_name
    ipv4_address = var.ip_addr
  }
  volumes {
    container_path = "/etc/nginx/conf.d/default.conf"
    host_path      = "C:\\Users\\klein_private\\Documents\\GitHub\\miniature-octo-vienna\\infrastructure\\nginx\\default.conf"
  }

output "host_ip" {
  description = "IP address of the container"
  value       = docker_container.api_gateway.ip_address
}
