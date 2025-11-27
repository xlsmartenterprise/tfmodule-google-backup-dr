output "backup_vault_id" {
  description = "The ID of the backup vault"
  value       = google_backup_dr_backup_vault.this.id
}

output "backup_vault_name" {
  description = "The name of the backup vault"
  value       = google_backup_dr_backup_vault.this.name
}

output "backup_plan_id" {
  description = "The ID of the backup plan"
  value       = google_backup_dr_backup_plan.this.id
}

output "backup_plan_name" {
  description = "The name of the backup plan"
  value       = google_backup_dr_backup_plan.this.name
}

output "backup_plan_association_id" {
  description = "The ID of the backup plan association"
  value       = google_backup_dr_backup_plan_association.this.id
}

output "backup_plan_association_name" {
  description = "The name of the backup plan association"
  value       = google_backup_dr_backup_plan_association.this.name
}
