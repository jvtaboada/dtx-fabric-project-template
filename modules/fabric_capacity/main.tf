resource "azurerm_fabric_capacity" "fabcapacity" {
  count = var.create_fabric_capacity ? 1 : 0
  
  name                = var.capacity_name
  resource_group_name = var.rg_name
  location            = var.location
  administration_members = var.admins_email
  sku {
    name = var.sku
    tier = "Fabric"
  }
}

# Se criou nova, consulta ela
data "fabric_capacity" "created_capacity_id" {
  count        = var.create_fabric_capacity ? 1 : 0
  display_name = azurerm_fabric_capacity.fabcapacity[0].name

  depends_on = [azurerm_fabric_capacity.fabcapacity]

  lifecycle {
    postcondition {
      condition     = self.state == "Active"
      error_message = "Fabric Capacity não está em estado Active."
    }
  }
}

# Se já existia, consulta ela
data "fabric_capacity" "provided_capacity_id" {
  count        = var.create_fabric_capacity ? 0 : 1
  display_name = var.existing_fabric_capacity_name

  lifecycle {
    postcondition {
      condition     = self.state == "Active"
      error_message = "Fabric Capacity não está em estado Active."
    }
  }
}