# tfmodule-google-backup-dr

Terraform module for managing Google Cloud Backup and DR resources including backup vaults, backup plans, and backup plan associations.

## Features

- Creates backup vault with configurable retention policies
- Defines backup plans with flexible scheduling (hourly/daily/weekly)
- Associates backup plans with GCP resources
- Supports backup window configuration
- Enforces minimum retention duration

## Usage

### Basic Example
```hcl
module "backup_dr" {
  source = "./tfmodule-google-backup-dr"

  project_id                                 = "my-project"
  region                                     = "us-central1"
  backup_vault_id                            = "my-backup-vault"
  backup_vault_description                   = "Backup vault for production databases"
  access_restriction                         = "WITHIN_ORGANIZATION"
  backup_minimum_enforced_retention_duration = "864000s"  # 10 days

  backup_plan_id        = "daily-backup-plan"
  resource_type         = "sqladmin.googleapis.com/Instance"
  backup_retention_days = 30
  recurrence_type       = "DAILY"
  time_zone             = "UTC"
  backup_window_start_hour = 2
  backup_window_end_hour   = 4
  backup_rule_id        = "daily-rule"

  backup_plan_association_id = "db-backup-association"
  instance_name              = "projects/my-project/locations/us-central1/instances/my-database"
}
```

### Hourly Backup Example
```hcl
module "backup_dr_hourly" {
  source = "./tfmodule-google-backup-dr"

  project_id                                 = "my-project"
  region                                     = "us-central1"
  backup_vault_id                            = "hourly-backup-vault"
  backup_vault_description                   = "Hourly backup vault"
  access_restriction                         = "WITHIN_PROJECT"
  backup_minimum_enforced_retention_duration = "86400s"  # 1 day

  backup_plan_id        = "hourly-backup-plan"
  resource_type         = "sqladmin.googleapis.com/Instance"
  backup_retention_days = 7
  recurrence_type       = "HOURLY"
  hourly_frequency      = 6
  time_zone             = "America/New_York"
  backup_window_start_hour = 0
  backup_window_end_hour   = 23
  backup_rule_id        = "hourly-rule"

  backup_plan_association_id = "db-hourly-association"
  instance_name              = "projects/my-project/locations/us-central1/instances/my-database"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The GCP project ID | `string` | n/a | yes |
| region | The region for Backup and DR resources | `string` | n/a | yes |
| backup_vault_id | The ID of the backup vault | `string` | n/a | yes |
| backup_vault_description | Description of the backup vault | `string` | n/a | yes |
| access_restriction | Access restriction for the backup vault | `string` | n/a | yes |
| backup_minimum_enforced_retention_duration | Minimum enforced retention duration for backups (e.g., '100000s') | `string` | n/a | yes |
| backup_plan_id | The ID of the backup plan | `string` | n/a | yes |
| resource_type | The resource type to backup (e.g., sqladmin.googleapis.com/Instance) | `string` | n/a | yes |
| backup_retention_days | Number of days to retain backups | `number` | n/a | yes |
| recurrence_type | Recurrence type for backup schedule (HOURLY, DAILY, WEEKLY) | `string` | n/a | yes |
| hourly_frequency | Frequency in hours for HOURLY recurrence (e.g., 6 for every 6 hours) | `number` | `null` | no |
| time_zone | Time zone for backup schedule | `string` | n/a | yes |
| backup_window_start_hour | Start hour of backup window (0-23) | `number` | n/a | yes |
| backup_window_end_hour | End hour of backup window (0-23) | `number` | n/a | yes |
| backup_rule_id | ID for the backup rule | `string` | n/a | yes |
| backup_plan_association_id | ID for the backup plan association | `string` | n/a | yes |
| instance_name | Name of the Instance to backup | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| backup_vault_id | The ID of the backup vault |
| backup_vault_name | The name of the backup vault |
| backup_plan_id | The ID of the backup plan |
| backup_plan_name | The name of the backup plan |
| backup_plan_association_id | The ID of the backup plan association |
| backup_plan_association_name | The name of the backup plan association |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| google | >= 7.0.0, < 8.0.0 |
| google-beta | >= 7.0.0, < 8.0.0 |

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for version history and changes.