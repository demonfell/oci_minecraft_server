provider "oci" {
  region = var.region
  # uncomment for SecurityToken auth
  # auth                = "SecurityToken"
  # config_file_profile = "DEFAULT"
  private_key_path = var.private_key_path
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  tenancy_ocid         = var.tenancy_ocid
  private_key_password = var.private_key_password
}
