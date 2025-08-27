# Convenções de nomes, tags, prefixos
locals {
    base_name = var.base_name
    base_name_trimmed     = replace(replace(local.base_name, "-", ""), "_", "")
    environment = var.environment

    rg_name = "rg-${local.base_name}-${local.environment}"

    fabric_capacity_name = "cap${local.base_name_trimmed}${local.environment}"
    fabric_workspace_name = "ws-${local.base_name}-${local.environment}"
    fabric_lh_bronze_name = "lh_bronze"
    fabric_lh_silver_name = "lh_silver"
    fabric_lh_gold_name = "lh_gold"
    fabric_nb_bronze_to_silver_name = "nb-bronze-to-silver"
    fabric_nb_silver_to_gold_name = "nb-silver-to-gold"
    fabric_main_pipeline_name = "pl-main"
}