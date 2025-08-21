# Convenções de nomes, tags, prefixos
locals {
    base_name = var.base_name
    base_name_trimmed     = replace(replace(local.base_name, "-", ""), "_", "")

    environment = var.environment

    rg_name = "rg-${local.base_name}-${local.environment}"
}