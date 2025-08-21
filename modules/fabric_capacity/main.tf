resource "azurerm_fabric_capacity" "fabcapacity" {
  name                = "fab${var.base_name}"
  resource_group_name = var.rg_name
  location            = var.location
  administration_members = [var.admins_email]
  sku {
    name = var.sku
    tier = "Fabric"
  }
}