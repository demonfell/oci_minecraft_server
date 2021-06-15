variable "minecraft_server_url" {
  default = "https://launcher.mojang.com/v1/objects/0a269b5f2c5b93b1712d0f5dc43b6182b9ab254e/server.jar"
}

variable "java16_package" {
  default = "jdk-16.0.1.aarch64"
}

variable "minecraft_server_test_vm_source_image_id" {
  default = "ocid1.image.oc1.iad.aaaaaaaaijzevirp67bdceiebqeg4epuqstqcogohn3gskw76ngxupke3zfa"
}

variable "compartment_ocid" {}
variable "private_key_file" {}
variable "region" {}
variable "ssh_authorized_keys" {}