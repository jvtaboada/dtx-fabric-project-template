# Orquestra os módulos

module "azure_resource_manager" {
  source = "./modules/azure_resource_manager"
  
  rg_name  = local.rg_name
  location = var.location
}

module "fabric_capacity" {
  source = "./modules/fabric_capacity"
  
  existing_fabric_capacity_name = var.existing_fabric_capacity_name
  capacity_name = local.fabric_capacity_name
  rg_name      = local.rg_name
  location     = var.location
  sku          = var.sku
  admins_email = var.admins_email

  depends_on = [module.azure_resource_manager]
}

module "fabric_workspace" {
  source = "./modules/fabric_workspace"

  capacity_id = module.fabric_capacity.capacity_id
  workspace_name = local.fabric_workspace_name

  depends_on = [module.fabric_capacity]
}