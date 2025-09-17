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

# Variáveis Azure DevOps
variable "azdevops_organization_name" {
  description = "Nome da organização do Azure DevOps"
  type        = string
  default     = ""
}

variable "azdevops_project_name" {
  description = "Nome do projeto dentro da organização do Azure DevOps"
  type        = string
  default     = ""
}

variable "azdevops_repository_name" {
  description = "Nome do repositório Git no projeto"
  type        = string
  default     = ""
}

variable "azdevops_branch_name" {
  description = "Nome da branch do repositório que será utilizada"
  type        = string
  default     = ""
}

variable "azdevops_directory_name" {
  description = "Nome do diretório dentro do repositório do Azure DevOps onde os itens do Fabric serão versionados"
  type        = string
  default     = ""
}