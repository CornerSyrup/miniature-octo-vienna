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

resource "docker_image" "icecream" {
  name = "icecream"
  build {
    path = "../icecream"
  }
  keep_locally = true
}

resource "docker_container" "icecream" {
  name  = "icecream_endpoint"
  image = docker_image.icecream.name
  ports {
    internal = 80
    external = 8080
  }
}
