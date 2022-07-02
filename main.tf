
resource "azurerm_resource_group" "week6" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./network"
  base_name           = "week6"
  location            = var.location
  resource_group_name = azurerm_resource_group.week6.name

}
module "db" {
  source              = "./db"
  location            = var.location
  privete_subnet_id   = module.network.privete_subnet_id
  resource_group_name = azurerm_resource_group.week6.name
  vnet_id             = module.network.vnet_id
  db_name             = var.dbname
}
