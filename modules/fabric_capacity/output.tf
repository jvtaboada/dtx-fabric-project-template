output "capacity_id" {
  value = (
      var.existing_fabric_capacity_name == "" 
      ? data.fabric_capacity.created_capacity_id[0].id 
      : data.fabric_capacity.provided_capacity_id[0].id
  )

  description = "Resource ID da Microsoft Fabric Capacity (nova ou existente)"
}
