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

module "fabric_lakehouse_bronze" {
  source = "./modules/fabric_lakehouse"

  lakehouse_name = local.fabric_lh_bronze_name
  workspace_id = module.fabric_workspace.workspace_id

  depends_on = [module.fabric_workspace]
}

module "fabric_lakehouse_silver" {
  source = "./modules/fabric_lakehouse"

  lakehouse_name = local.fabric_lh_silver_name
  workspace_id = module.fabric_workspace.workspace_id

  depends_on = [module.fabric_workspace]
}

module "fabric_lakehouse_gold" {
  source = "./modules/fabric_lakehouse"

  lakehouse_name = local.fabric_lh_gold_name
  workspace_id = module.fabric_workspace.workspace_id

  depends_on = [module.fabric_workspace]

  #adicionar posteriormente o configuration - confirmar enabled schemas
}

module "fabric_notebook_bronze_to_silver" {
  source = "./modules/fabric_notebook"

  notebook_name = local.fabric_nb_bronze_to_silver_name
  workspace_id = module.fabric_workspace.workspace_id

  depends_on = [module.fabric_workspace]

  #adicionar posteriormente as definitions do notebook
}

module "fabric_notebook_silver_to_gold" {
  source = "./modules/fabric_notebook"

  notebook_name = local.fabric_nb_silver_to_gold_name
  workspace_id = module.fabric_workspace.workspace_id

  depends_on = [module.fabric_workspace]

  #adicionar posteriormente as definitions do notebook
}

module "fabric_pipeline" {
  source = "./modules/fabric_pipeline"

  pipeline_name = local.fabric_main_pipeline_name
  workspace_id = module.fabric_workspace.workspace_id

  notebook_id_bronze_to_silver = module.fabric_notebook_bronze_to_silver.notebook_id 
  notebook_id_silver_to_gold = module.fabric_notebook_silver_to_gold.notebook_id

  depends_on = [module.fabric_workspace, module.fabric_notebook_bronze_to_silver, module.fabric_notebook_silver_to_gold]
}