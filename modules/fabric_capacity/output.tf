output "capacity_id" {
  value = (
      var.create_fabric_capacity ? data.fabric_capacity.created_capacity_id[0].id : data.fabric_capacity.provided_capacity_id[0].id
  )

  description = "Resource ID da Microsoft Fabric Capacity (nova ou existente)"
}
