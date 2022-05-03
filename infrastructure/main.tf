resource "docker_image" "icecream" {
  name = "icecream"
  build {
    path = "../icecream"
  }
  keep_locally = true
}

resource "docker_image" "order" {
  name = "order"
  build {
    path = "../order"
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

resource "docker_container" "order" {
  name  = "order_endpoint"
  image = docker_image.order.name
  ports {
    internal = 80
    external = 8081
  }
}
