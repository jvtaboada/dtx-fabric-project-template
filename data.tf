data "azuread_group" "fabric_workspace_admin" {
  count     = local.enable_workspace_role_assignment ? 1 : 0
  display_name     = var.fabric_workspace_admins_sg_name
  security_enabled = true
}