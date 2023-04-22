terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("key.json")

  project = "cohesive-poetry-244916"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "terraform_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "edg-us" {
  name         = "edg-us"
  machine_type = "e2-medium"
  zone         = "us-central1-c"



  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }










