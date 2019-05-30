# Configure the Docker provider
provider "docker" {
  host = "tcp://127.0.0.1:2376/"
}

# Create a container
resource "docker_container" "container" {
  image = "${docker_image.image.latest}"
  name  = "hello-world"
  ports {
    internal = 80
    external = 4269
  }
}

resource "docker_image" "image" {
  name = "nginxdemos/hello"
}
