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
    external = 8081
  }
}
