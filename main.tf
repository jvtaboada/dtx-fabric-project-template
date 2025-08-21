# Orquestra os módulos

module "azure_resource_manager" {
  source = "./modules/azure_resource_manager"
  
  rg_name  = local.rg_name
  location = var.location
}

module "fabric_capacity" {
  source = "./modules/fabric_capacity"
  
  base_name    = local.base_name_trimmed  # se o módulo usar
  rg_name      = local.rg_name
  location     = var.location
  sku          = var.sku
  admins_email = var.admins_email
}