provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}

resource "vault_generic_endpoint" "staging_database" {
  disable_read         = true
  disable_delete       = true
  ignore_absent_fields = true
  path                 = "app-db/cluster/staging-3"
  data_json            = <<DATA
{
  "host": "localhost",
  "port": "5432",
  "username": "postgres",
  "password":  "${var.pg_root_pass}",
  "ssl_mode": "disable"
}
DATA
}

resource "vault_generic_endpoint" "database" {
  path                 = "app-db/cluster/staging-3/tms"
  data_json            = "{}"
  ignore_absent_fields = true
  depends_on           = [vault_generic_endpoint.staging_database]
}

resource "vault_generic_endpoint" "app_simple" {
  disable_read         = true
  disable_delete       = true
  ignore_absent_fields = true
  path                 = "app-db/roles/app"
  data_json            = "{}"
  depends_on           = [vault_generic_endpoint.database]
}

resource "vault_policy" "database_policy" {
  name       = "db-tms"
  policy     = <<-POLICY
  path "app-db/creds/staging-3/tms/app" {
    capabilities = ["read"]
  }
  POLICY
  depends_on = [vault_generic_endpoint.app_simple]
}
