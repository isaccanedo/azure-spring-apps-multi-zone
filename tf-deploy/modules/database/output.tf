output "database_username" {
  value       = azurerm_mysql_flexible_server.mysql_server.administrator_login
}

output "database_password" {
  value = azurerm_mysql_flexible_server.mysql_server.administrator_password
}