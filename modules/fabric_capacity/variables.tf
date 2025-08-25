variable "existing_fabric_capacity_name" {
  type        = string
  description = "Nome de uma capacidade Fabric existente. Se vazio, será criada uma nova."
  default     = ""
}

variable "capacity_name" {
  description = "Nome da Capacidade do Fabric"
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