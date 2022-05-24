## Start vault server
    vault server -config=config.hcl

## Register vault plugin
    vault plugin register -sha256=81ef98688de05e4df5cc29b31de77854e5a119f8e487d9b5c064aabceaac0a8e secret vault-plugin-postgres_darwin_amd64
    vault secrets enable -path=app-db vault-plugin-postgres_darwin_amd64

## Start postgres server
    docker-compose up

## Populate data vault
    terraform init
    terraform apply

## Get postgres root user and pass
    vault read app-db/cluster/staging-3

## Generate new username and password for tms
    vault read app-db/creds/staging-3/tms/app
