terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}

provider "docker" {}

# ✅ Correct block to build the Docker image
resource "docker_image" "my_site" {
  name = "my-terraform-site:latest"

  build {
    context    = "${path.module}/website"
    dockerfile = "Dockerfile"
  }
}

# ✅ Run Docker container from built image
resource "docker_container" "web" {
  name  = "terraform-website"
  image = docker_image.my_site.image_id

  ports {
    internal = 80
    external = 8888
  }
}
