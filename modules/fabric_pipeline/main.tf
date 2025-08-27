resource "fabric_data_pipeline" "fabpipeline" {
  display_name = var.pipeline_name
  workspace_id = var.workspace_id
  format       = "Default"

  definition = {
    "pipeline-content.json" = {
      source = "${path.root}/definitions/pipelines/pipeline-main-content.json"
      tokens = {
        "pipeline_name" = var.pipeline_name
        "workspace_id" = var.workspace_id
        "notebook_id_bronze_to_silver" = var.notebook_id_bronze_to_silver
        "notebook_id_silver_to_gold" = var.notebook_id_silver_to_gold
      }
    }
  }
}