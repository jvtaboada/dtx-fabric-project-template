resource "fabric_workspace" "fabworkspace" {
  display_name = var.workspace_name
  capacity_id  = var.capacity_id
}

data "fabric_workspace" "created_workspace"{
  display_name = var.workspace_name

  depends_on = [fabric_workspace.fabworkspace]
}