terraform {
  required_version = ">= 1.1.9"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "= 3.6"
    }
  }
}

provider "vault" {
  address = "http://localhost:8200"
  token   = "hvs.cusd1LSwO9Y4rygHuf9P0i3P" # replace with new vault token
}
