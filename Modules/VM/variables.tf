variable "public_instance_ami" {
 type = string 
}

variable "public_instance_type" {
 type = string 
}

variable "public_ip_addres" {
 type = bool 
 default = true
}

variable "public_subnet_id" {
 type = string 
}

variable "public_instance_name" {
 type = string 
 default = "public-instance"
}

variable "private_instance_ami" {
 type = string 
}

variable "private_instance_type" {
 type = string 
}

variable "private_public_ip_addres" {
 type = bool 
 default = false
}

variable "private_subnet_id" {
 type = string 
}

variable "private_instance_name" {
 type = string 
 default = "private-instance"
}

variable "vpc_id" {
  type = string
}

variable "public_key" {
  type = string
  default = "privatekey"
}

variable "tg_name" {
  type = string
  default = "tg-tf"
}

variable "lb_name" {
  type = string
  default = "lb-tf"
}

variable "lb_port" {
  type = number
  default = 80
}

variable "lb_protocol" {
  type = string
  default = "HTTP"
}

variable "lb_internal_value" {
  type = bool
  default = false
}

variable "lb_type" {
  type = string
  default = "application"
}

variable "lb_subnets" {
  type = list
}