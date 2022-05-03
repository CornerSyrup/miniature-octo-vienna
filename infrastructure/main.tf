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

module "icecream" {
  source   = "../icecream"
  ext_port = 8080
}

module "order" {
  source   = "../order"
  ext_port = 8081
}
