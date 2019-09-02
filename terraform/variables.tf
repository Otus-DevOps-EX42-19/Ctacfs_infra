variable "pub_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "priv_key_path" {
  default = "~/.ssh/id_rsa"
}

variable "region" {
  default = "europe=north1"
}

variable "project" {
}

variable "disk_image" {
}

