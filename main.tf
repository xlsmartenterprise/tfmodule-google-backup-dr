resource "google_backup_dr_backup_vault" "this" {
  location                                   = var.region
  backup_vault_id                            = var.backup_vault_id
  force_update                               = true
  access_restriction                         = var.access_restriction
  backup_retention_inheritance               = "INHERIT_VAULT_RETENTION"
  ignore_inactive_datasources                = true
  ignore_backup_plan_references              = true
  allow_missing                              = true
  backup_minimum_enforced_retention_duration = var.backup_minimum_enforced_retention_duration
}

resource "google_backup_dr_backup_plan" "this" {
  location       = var.region
  backup_plan_id = var.backup_plan_id
  resource_type  = var.resource_type
  backup_vault   = google_backup_dr_backup_vault.this.id
  
  backup_rules {
    rule_id               = var.backup_rule_id
    backup_retention_days = var.backup_retention_days
    
    standard_schedule {
      recurrence_type  = var.recurrence_type
      hourly_frequency = var.hourly_frequency
      time_zone        = var.time_zone
      
      backup_window {
        start_hour_of_day = var.backup_window_start_hour
        end_hour_of_day   = var.backup_window_end_hour
      }
    }
  }
}

resource "google_backup_dr_backup_plan_association" "this" {
  location                    = var.region
  resource_type               = var.resource_type
  backup_plan                 = google_backup_dr_backup_plan.this.name
  backup_plan_association_id  = var.backup_plan_association_id
  resource                    = var.instance_name
}