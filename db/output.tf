output "db_server_user" {
  value = azurerm_postgresql_flexible_server.psqlservice.administrator_login
}
output "db_server_password" {
  sensitive = true
  value     = azurerm_postgresql_flexible_server.psqlservice.administrator_password
}
