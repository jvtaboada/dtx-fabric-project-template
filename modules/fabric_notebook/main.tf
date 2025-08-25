resource "fabric_notebook" "fabnotebook" {
  display_name = var.notebook_name
  workspace_id = var.workspace_id
}