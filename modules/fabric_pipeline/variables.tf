variable "pipeline_name" {
  description = "Nome do pipeline"
  type        = string
}

variable "workspace_id" {
  description = "Resource ID do workspace do Fabric"
  type        = string
}

variable "notebook_id_bronze_to_silver" {
    description = "Resource ID do notebook nb-bronze-to-silver"
    type        = string
}

variable "notebook_id_silver_to_gold" {
    description = "Resource ID do notebook nb-silver-to-gold"
    type        = string
}