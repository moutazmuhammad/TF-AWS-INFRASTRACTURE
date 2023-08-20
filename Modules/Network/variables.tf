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

variable "igw_name" {
  type    = string
  default = "main-igw"
}

variable "nat_name" {
  type    = string
  default = "ngw"
}

variable "public_route_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "public_route_name" {
  type    = string
  default = "public-route"
}

variable "private_route_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "private_route_name" {
  type    = string
  default = "private-route"
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

