variable "workspace_id" {
  description = "ID do workspace do Fabric"
  type        = string
}

variable "organization_name" {
  description = "Nome da organização do Azure DevOps"
  type        = string
}

variable "project_name" {
  description = "Nome do projeto dentro da organização do Azure DevOps"
  type        = string
}

variable "repository_name" {
  description = "Nome do repositório Git no projeto do Azure DevOps"
  type        = string
}

variable "branch_name" {
  description = "Nome da branch do repositório que será utilizada"
  type        = string
}

variable "directory_name" {
  description = "Nome do diretório dentro do repositório do Azure DevOps onde os itens do Fabric serão versionados"
  type        = string
}