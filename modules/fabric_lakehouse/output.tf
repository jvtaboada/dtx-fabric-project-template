output "lakehouse_id" {
  value = data.fabric_lakehouse.get_lakehouse_id.id

  description = "Resource ID do lakehouse criado"
}