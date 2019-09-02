terraform {
  required_version = "0.11.15"
}

provider "google" {
  version = "2.0.0"
  project = "{$var.project}"
  region = "${var.region}"
  credentials = "key.json"
}

resource "google_compute_project_metadata" "default" {
  metadata = {
    ssh-keys = "ctacfs2:${file(var.pub_key_path)} ctacfs3:${file(var.pub_key_path)}"
  }
}

resource "google_compute_instance" "app" {
  name = "reddit-app"
  machine_type = "g1-small"
  tags = ["reddit-app"]
  zone = "europe-north1-a"
  boot_disk {
    initialize_params {
    image = "reddit-base"
    }
  }
  metadata {
    block-project-ssh-keys = true
    ssh-keys = "ctacfs:${file(var.pub_key_path)}"
  }

  network_interface {
    network = "default"
    access_config {}
  }

  connection {
    type = "ssh"
    user = "ctacfs"
    agent = false
    private_key = "${file(var.priv_key_path)}"
  }

  provisioner "file" {
    source = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["9292"]
  }
  source_ranges = ["0.0.0.0"]
  target_tags = ["reddit-app"]
}








