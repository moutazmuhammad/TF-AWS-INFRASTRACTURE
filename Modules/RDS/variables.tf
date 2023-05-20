variable "rds_allocated_storage" {
  type = number
  default = 10
}

variable "rds_engine" {
  type = string
}

variable "rds_engine_version" {
  type = string
  default = "5.7"
}


variable "rds_instance_class" {
  type = string
  default = "db.t2.micro"
}

variable "rds_db_name" {
  type = string
  default = "sqlTF"
}

variable "rds_username" {
  type = string
}

variable "rds_password" {
  type = string
}

variable "rds_parameter_group_name" {
  type = string
  default = "default.mysql5.7"
}

variable "rds_subnet_gp_name" {
  type = string
}

variable "rds_skip_final_snapshot" {
  type = bool
  default = true
}

variable "rds_backup_retention_period" {
  type = number
  default = 0
}

variable "vpc_id" {
  type = string
}