variable "create_fabric_capacity" {
  description = "Flag que indica se é necessário ou não criar uma nova capacacidade Fabric"
  type        = bool
}

variable "existing_fabric_capacity_name" {
  type        = string
  description = "Nome de uma capacidade Fabric existente - se vazio, será criada uma nova"
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
  default     = "F2"

  validation {
    condition     = contains(["F2", "F4", "F8", "F16", "F32", "F64", "F128", "F256", "F512", "F1024", "F2048"], var.sku)
    error_message = "Valor inválido para SKU da capacidade Fabric. Valores válidos são: ['F2', 'F4', 'F8', 'F16', 'F32', 'F64', 'F128', 'F256', 'F512', 'F1024', 'F2048']."
  }
}

variable "admins_email" {
  description = "Email dos admins da capacidade Fabric"
  type        = set(string)
}