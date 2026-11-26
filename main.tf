terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.2.0"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

# Download Docker image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

# Create Docker container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "my-nginx"

  ports {
    internal = 80
    external = 8070
  }
}
