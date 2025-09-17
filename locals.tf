locals {
    base_name = var.base_name
    base_name_trimmed = replace(replace(local.base_name, "-", ""), "_", "")
    environment = var.environment

    rg_name = "rg-${local.base_name}-${local.environment}"

    create_fabric_capacity = trimspace(var.existing_fabric_capacity_name) == ""
    fabric_capacity_name = local.create_fabric_capacity ? "cap${local.base_name_trimmed}${local.environment}" : var.existing_fabric_capacity_name
    fabric_capacity_admins = split(",", var.fabric_capacity_admins)
    
    fabric_workspace_name = "ws-${local.base_name}-${local.environment}"
    enable_workspace_role_assignment = trimspace(var.fabric_workspace_admins_sg_name) != ""
    
    fabric_lh_bronze_name = "lh_bronze"
    fabric_lh_silver_name = "lh_silver"
    fabric_lh_gold_name = "lh_gold"
    fabric_nb_bronze_to_silver_name = "nb-bronze-to-silver"
    nb_bronze_to_silver_definition_path = "${path.root}/definitions/notebooks/notebook-bronze-to-silver-content.ipynb.tmpl"
    fabric_nb_silver_to_gold_name = "nb-silver-to-gold"
    nb_silver_to_gold_definition_path = "${path.root}/definitions/notebooks/notebook-silver-to-gold-content.ipynb.tmpl"
    fabric_main_pipeline_name = "pl-main"
    main_pipeline_definition_path = "${path.root}/definitions/pipelines/pipeline-main-content.json"

    create_ws_git_integration = (
        trimspace(var.azdevops_organization_name) != "" &&
        trimspace(var.azdevops_project_name)      != "" &&
        trimspace(var.azdevops_repository_name)   != "" &&
        trimspace(var.azdevops_branch_name)       != "" &&
        trimspace(var.azdevops_directory_name)    != ""
        )
}