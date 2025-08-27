resource "fabric_notebook" "fabnotebook" {
  display_name = var.notebook_name
  workspace_id = var.workspace_id
}

data "fabric_notebook" "get_notebook_id" {
  display_name = var.notebook_name
  workspace_id = var.workspace_id

  depends_on = [fabric_notebook.fabnotebook]
}