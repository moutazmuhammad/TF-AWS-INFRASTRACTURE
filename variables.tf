variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_enable_dns_hostnames" {
  type = bool
}

variable "vpc_enable_dns_support" {
  type = bool
}


variable "public_instance_ami" {
  type = string
}

variable "public_instance_type" {
  type = string
}

variable "private_instance_ami" {
  type = string
}

variable "private_instance_type" {
  type = string
}


variable "az_subnet_pb_one" {
  type = string
}


variable "az_subnet_pb_two" {
  type = string
}


variable "az_subnet_pr_one" {
  type = string
}

variable "az_subnet_pr_two" {
  type = string
}


variable "redis_node_type" {
  type = string
}

variable "redis_num_cache_nodes" {
  type = number
}

variable "rds_engine" {
  type = string
}


variable "rds_username" {
  type = string
}

variable "rds_password" {
  type = string
}
