variable "subid" {
  type        = string
  description = "Azure subscription ID."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name for the backend resources."
}

variable "location" {
  type        = string
  description = "Azure region for the backend resources."
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name for Terraform state."
}

variable "storage_account_tier" {
  type        = string
  description = "Storage account tier."
}

variable "storage_replication_type" {
  type        = string
  description = "Storage account replication type."
}

variable "governance_storage_container_name" {
  type        = string
  description = "Storage container name for Terraform state."
}

variable "connectivity_storage_container_name" {
  type        = string
  description = "Storage container name for Terraform state."
}

variable "management_storage_container_name" {
  type        = string
  description = "Storage container name for Terraform state."
}

variable "workloads_storage_container_name" {
  type        = string
  description = "Storage container name for Terraform state."
}

variable "storage_container_access_type" {
  type        = string
  description = "Storage container access type"
}
