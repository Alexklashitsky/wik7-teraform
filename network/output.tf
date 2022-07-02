output "app_public_ip" {
  value = azurerm_public_ip.publicIpLB.ip_address
}
output "app_public_ip_id" {
  value = azurerm_public_ip.publicIpLB.id
}


output "mannger_machine_public_ip" {
  value = azurerm_public_ip.publicIpApp.ip_address

}

output "privete_subnet_id" {
  value = azurerm_subnet.privete.id
}
output "public_subnet_id" {
  value = azurerm_subnet.public.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "terminal_net_interface_id" {
  value = azurerm_network_interface.appNic.id
}
