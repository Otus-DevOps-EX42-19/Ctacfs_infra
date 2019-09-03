terraform {
  required_version = "0.11.15"
}

provider "google" {
  version = "2.0.0"
  project = "${var.project}"
  region = "${var.region}"
#  credentials = "key.json"
}

module "app" {
  source = "../modules/app"
  pub_key_path = "${var.pub_key_path}"
}

module "db" {
  source = "../modules/db"
  pub_key_path = "${var.pub_key_path}"
  db_disk_image = "${ var.db_disk_image}"
}

module "vpc" {
  source = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}

