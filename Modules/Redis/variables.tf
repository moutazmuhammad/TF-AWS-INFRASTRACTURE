
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

variable "vpc_id" {
  type = string
}