storage "raft" {
  path    = "./vault_new/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "127.0.0.1:8203"
  tls_disable = "true"
}

api_addr = "http://127.0.0.1:8203"
cluster_addr = "http://127.0.0.1:8204"
ui = true

plugin_directory = "./"
