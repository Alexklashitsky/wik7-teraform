output "app_public_ip" {
  value = module.network.app_public_ip
}

output "mannger_machine_public_ip" {
  value = module.network.mannger_machine_public_ip
}
output "db_server_user" {
  value = module.db.db_server_user
}
output "db_server_password" {
  value     = module.db.db_server_password
  sensitive = true
}
output "admin_password_for_servers_and_db" {
  value = var.secret
}

output "admin_user_for_servers" {
  value = var.admin_user
}
output "admin_password_for_servers" {
  value = var.secret
}

