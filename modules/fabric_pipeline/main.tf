resource "fabric_data_pipeline" "fabpipeline" {
  display_name = var.pipeline_name
  workspace_id = var.workspace_id
  format       = "Default"

  definition = {
    "pipeline-content.json" = {
      source = var.pipeline_definition_path
      tokens = var.tokens
    }
  }
}