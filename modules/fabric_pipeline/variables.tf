variable "pipeline_name" {
  description = "Nome do pipeline"
  type        = string
}

variable "workspace_id" {
  description = "Resource ID do workspace do Fabric"
  type        = string
}

variable "pipeline_definition_path" {
  description = "O caminho para o arquivo de pipeline 'json'"
  type        = string
}

variable "tokens" {
  description = "Lista de tokens para ser substituído no arquivo de definitions da pipeline"
  type        = map(string)
  default     = {}
}