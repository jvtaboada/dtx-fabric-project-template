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
  description = "Nome de uma capacidade Fabric existente. Se vazio, será criada uma nova."
  default     = ""
}

variable "sku" {
  description = "SKU da capacidade Fabric"
  type        = string
}

variable "admins_email" {
  description = "Email dos admins da capacidade Fabric"
  type        = string
}

