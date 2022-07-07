## Start vault server
    vault server -config=config.hcl

## Initialize vault
    vault operator init -key-shares=1 -key-threshold=1
    vault operator unseal

## Vault login
    vault login <root_token>

## Register vault plugin
    vault plugin register -sha256=81ef98688de05e4df5cc29b31de77854e5a119f8e487d9b5c064aabceaac0a8e secret vault-plugin-postgres_darwin_amd64
    vault secrets enable -path=app-db vault-plugin-postgres_darwin_amd64

## Register sentry plugin
    vault plugin register -sha256=d5bcf05780215c5614619bd4fa54a2c13e4c4689e2e2ba12850c137c591abd28 secret vault-plugin-sentry_darwin_amd64
    vault secrets enable -path=secret-sentry vault-plugin-sentry_darwin_amd64

## Start postgres server
    docker-compose up

## Populate data vault
    terraform init
    terraform apply

## Get postgres root user and pass
    vault read app-db/cluster/staging-3

## Generate new username and password for tms
    vault read app-db/creds/staging-3/tms/app

## Get sentry secrets
    vault read /secret-sentry/dsn/web-app-1
