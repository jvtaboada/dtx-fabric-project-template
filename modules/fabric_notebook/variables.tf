variable "notebook_name" {
  description = "Nome do notebook"
  type        = string
}

variable "workspace_id" {
  description = "Resource ID do workspace do Fabric"
  type        = string
}

variable "notebook_definition_path" {
  description = "O caminho para o arquivo de notebook 'ipynb'"
  type        = string
}

variable "tokens" {
  description = "Lista de tokens para ser substituído no arquivo de definitions do notebook"
  type        = map(string)
  default     = {}
}