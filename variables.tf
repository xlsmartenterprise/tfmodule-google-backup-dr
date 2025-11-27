variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region for Backup and DR resources"
  type        = string
}

variable "backup_vault_id" {
  description = "The ID of the backup vault"
  type        = string
}

variable "backup_vault_description" {
  description = "Description of the backup vault"
  type        = string
}

variable "access_restriction" {
  description = "Access restriction for the backup vault"
  type        = string
}

variable "backup_minimum_enforced_retention_duration" {
  description = "Minimum enforced retention duration for backups (e.g., '100000s')"
  type        = string
}

variable "backup_plan_id" {
  description = "The ID of the backup plan"
  type        = string
}

variable "resource_type" {
  description = "The resource type to backup (e.g., sqladmin.googleapis.com/Instance)"
  type        = string
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
}

variable "recurrence_type" {
  description = "Recurrence type for backup schedule (HOURLY, DAILY, WEEKLY)"
  type        = string
}

variable "hourly_frequency" {
  description = "Frequency in hours for HOURLY recurrence (e.g., 6 for every 6 hours)"
  type        = number
  default     = null
}

variable "time_zone" {
  description = "Time zone for backup schedule"
  type        = string
}

variable "backup_window_start_hour" {
  description = "Start hour of backup window (0-23)"
  type        = number
}

variable "backup_window_end_hour" {
  description = "End hour of backup window (0-23)"
  type        = number
}

variable "backup_rule_id" {
  description = "ID for the backup rule"
  type        = string
}

variable "backup_plan_association_id" {
  description = "ID for the backup plan association"
  type        = string
}

variable "instance_name" {
  description = "Name of the Instance to backup"
  type        = string
}
