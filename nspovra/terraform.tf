terraform {
  required_providers {
    vra = {
      source = "vmware/vra"
    }
  }
  required_version = ">= 0.13"
}
provider "vra" {
  url           = var.vra_url
  refresh_token = var.vra_refresh_token
  insecure      = true
}
