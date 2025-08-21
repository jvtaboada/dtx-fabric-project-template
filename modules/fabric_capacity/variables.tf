# Variáveis Fabric
variable "base_name" {
  description = "Nome base do projeto"
  type        = string
}

variable "rg_name" {
  description = "Nome do resource group"
  type        = string
}

variable "location" {
  description = "Região onde o resource group será criado"
  type        = string
}

variable "sku" {
  description = "SKU da capacidade Fabric"
  type        = string
}

variable "admins_email" {
  description = "Email dos admins da capacidade Fabric"
  type        = string
}
