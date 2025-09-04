# Orquestra os módulos

module "azure_resource_manager" {
  source = "./modules/azure_resource_manager"
  
  rg_name  = local.rg_name
  location = var.location
}

module "fabric_capacity" {
  source = "./modules/fabric_capacity"
  
  create_fabric_capacity = local.create_fabric_capacity
  existing_fabric_capacity_name = var.existing_fabric_capacity_name
  capacity_name = local.fabric_capacity_name
  rg_name      = local.rg_name
  location     = var.location
  sku          = var.sku
  admins_email = local.fabric_capacity_admins

  depends_on = [module.azure_resource_manager]
}

module "fabric_workspace" {
  source = "./modules/fabric_workspace"

  capacity_id = module.fabric_capacity.capacity_id
  workspace_name = local.fabric_workspace_name

  depends_on = [module.fabric_capacity]
}

module "fabric_workspace_role_assignment" { 
  source = "./modules/fabric_workspace_role_assignment"

  count = local.enable_workspace_role_assignment ? 1 : 0
  workspace_id = module.fabric_workspace.workspace_id
  principal_id   = data.azuread_group.fabric_workspace_admin[0].object_id

  depends_on = [module.fabric_workspace]
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
  notebook_definition_path = local.nb_bronze_to_silver_definition_path

  tokens = {
    "default_lh_name": local.fabric_lh_bronze_name
    "lh_bronze_id": module.fabric_lakehouse_bronze.lakehouse_id
    "lh_silver_id": module.fabric_lakehouse_silver.lakehouse_id
    "workspace_id": module.fabric_workspace.workspace_id
  }

  depends_on = [module.fabric_workspace]
}

module "fabric_notebook_silver_to_gold" {
  source = "./modules/fabric_notebook"

  notebook_name = local.fabric_nb_silver_to_gold_name
  workspace_id = module.fabric_workspace.workspace_id
  notebook_definition_path = local.nb_silver_to_gold_definition_path

  tokens = {
    "default_lh_name": local.fabric_lh_silver_name
    "lh_silver_id": module.fabric_lakehouse_silver.lakehouse_id
    "lh_gold_id": module.fabric_lakehouse_gold.lakehouse_id
    "workspace_id": module.fabric_workspace.workspace_id
  }

  depends_on = [module.fabric_workspace]
}

module "fabric_pipeline" {
  source = "./modules/fabric_pipeline"

  pipeline_name = local.fabric_main_pipeline_name
  workspace_id = module.fabric_workspace.workspace_id
  pipeline_definition_path = local.main_pipeline_definition_path

  tokens = {
    "pipeline_name" = local.fabric_main_pipeline_name
    "workspace_id" = module.fabric_workspace.workspace_id
    "notebook_id_bronze_to_silver" = module.fabric_notebook_bronze_to_silver.notebook_id 
    "notebook_id_silver_to_gold" = module.fabric_notebook_silver_to_gold.notebook_id
  }

  depends_on = [module.fabric_workspace, module.fabric_notebook_bronze_to_silver, module.fabric_notebook_silver_to_gold]
}