# Variáveis projeto
variable "base_name" {
  description = "Nome base do projeto"
  type        = string
}

variable "environment" {
  description = "Tipo de ambiente do projeto" #dev - hmg - prd
  type        = string
}

# Variáveis Azure
variable "tenant_id" {
  description = "ID do Tenant do Azure"
  type        = string
}

variable "subscription_id" {
  description = "ID da Subscription do Azure"
  type        = string
}

variable "location" {
  description = "Região onde o resource group será criado"
  type        = string
}

# Variáveis Fabric
variable "existing_fabric_capacity_name" {
  type        = string
  description = "Nome de uma capacidade Fabric existente - se vazio, será criada uma nova"
  default     = ""
}

variable "sku" {
  description = "SKU da capacidade Fabric"
  type        = string
}

variable "fabric_capacity_admins" {
  description = "Lista de email dos admins da capacidade Fabric"
  type        = string
}

variable "fabric_workspace_admins_sg_name" { 
  description = "Nome do grupo de segurança (Entra) com os administradores do workspace Fabric"
  type        = string
  default     = ""
}