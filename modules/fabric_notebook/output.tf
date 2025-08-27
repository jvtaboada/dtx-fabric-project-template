output "notebook_id" {
  value = data.fabric_notebook.get_notebook_id.id

  description = "Resource ID do notebook criado"
}