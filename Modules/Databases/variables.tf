
variable "vpc_id" {
  type = string
}

variable "redis_cluster_id" {
    type = string
    default = "redis-cluster"
} 
 
variable "redis_engine" {
    type = string
    default = "redis"
} 

variable "redis_node_type" {
    type = string
} 
 
variable "redis_num_cache_nodes" {
    type = number
} 

variable "redis_parameter_group_name" {
    type = string
    default = "default.redis3.2"
}  

variable "redis_engine_version" {
  type = string
  default = "3.2.10"
}

variable "redis_port" {
    type = number
    default = 6379
} 

variable "redis_subnet_ids" {
  type = list
}





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