resource "fabric_workspace" "fabworkspace" {
  display_name = var.workspace_name
  capacity_id  = var.capacity_id
}