resource "oci_database_cloud_vm_cluster_iorm_config" "database_cloud_vm_cluster_iorm_configs" {
  for_each = var.database_cloud_vm_cluster_iorm_configs

  cloud_vm_cluster_id = each.value.cloud_vm_cluster_id
  objective           = each.value.objective

  dynamic "db_plans" {
    for_each = each.value.db_plans
    content {
      db_name = db_plans.value.db_name
      share   = db_plans.value.share
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

