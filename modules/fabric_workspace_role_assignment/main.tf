resource "fabric_workspace_role_assignment" "role_assignment" {  
  workspace_id = var.workspace_id
  principal = {
    id   = var.principal_id
    type = "Group"
  }
    
  role = "Admin"
}