variable "location" {
  type    = string
  default = "australiaeast"
}
variable "resource_group_name" {
  type    = string
  default = "resource_group_name"
}
variable "application_port" {
  default = 8080
  type    = number
}
variable "dbname" {
  default = "somedbname"
  type    = string
}
variable "secret" {
  default = "Alex310224993"
}

variable "admin_user" {
  default = "app"
}
variable "vm_count" {
  default = 2
  type    = number
}
variable "storage_account" {
  default = "backendstorage2022"
}

