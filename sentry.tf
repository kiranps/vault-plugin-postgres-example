resource "vault_generic_endpoint" "sentry" {
  path                 = "secret-sentry/config"
  ignore_absent_fields = true
  data_json            = <<DATA
{
  "org": "testkiran",
  "token": "XXX",
  "timeout": 10
}
DATA
}

resource "vault_generic_endpoint" "web_app_1" {
  path                 = "secret-sentry/project/web-app-1"
  ignore_absent_fields = true
  data_json            = <<DATA
{
  "project": "web-app-1",
  "team": "testkiran",
  "default_dsn_label": "production"
}
DATA
}
