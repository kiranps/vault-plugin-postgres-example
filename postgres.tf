terraform {
  required_version = ">= 1.1.9"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "= 3.6"
    }
  }
}

module "vault" {
  source       = "./modules/vault"
  vault_addr   = "http://127.0.0.1:8200"
  vault_token  = "hvs.3Kk6d5BPnq34hXn60ioRgua3"
  pg_root_pass = "example"
}

module "vault_new" {
  source       = "./modules/vault_new"
  vault_addr   = "http://127.0.0.1:8203"
  vault_token  = "hvs.pzVQ4nVip4hV9TViNdjzX0NQ"
  pg_root_pass = "00d6ae95-aa94-6004-0c85-370c729ebfb6"
}
