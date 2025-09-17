# Integração Git está em PREVIEW - podem ter alterações futuras
resource "fabric_workspace_git" "azuredevops_integration" {
  workspace_id            = var.workspace_id
  initialization_strategy = "PreferWorkspace"
  
  git_provider_details = {
    git_provider_type = "AzureDevOps"
    organization_name = var.organization_name
    project_name      = var.project_name
    repository_name   = var.repository_name
    branch_name       = var.branch_name
    directory_name    = var.directory_name
  }

  git_credentials = {
    source = "Automatic"
  }
}