resource "fabric_notebook" "fabnotebook" {
  display_name = var.notebook_name
  workspace_id = var.workspace_id
  format = "ipynb"

  definition = {
    "notebook-content.ipynb" = {
      source = var.notebook_definition_path
      tokens = var.tokens
    }
  }
}

data "fabric_notebook" "get_notebook_id" {
  display_name = var.notebook_name
  workspace_id = var.workspace_id

  depends_on = [fabric_notebook.fabnotebook]
}