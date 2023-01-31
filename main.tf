module "network" {
  source                   = "./Modules/Network"
  vpc_name                 = var.vpc_name
  vpc_cidr_block           = var.vpc_cidr_block
  vpc_enable_dns_hostnames = var.vpc_enable_dns_hostnames
  vpc_enable_dns_support   = var.vpc_enable_dns_support
  az_subnet_pb_one         = var.az_subnet_pb_one
  az_subnet_pb_two         = var.az_subnet_pb_two
  az_subnet_pr_one         = var.az_subnet_pr_one
  az_subnet_pr_two         = var.az_subnet_pr_two
}

module "vm" {
  source                = "./Modules/VM"
  public_instance_ami   = var.public_instance_ami
  public_instance_type  = var.public_instance_type
  public_subnet_id      = module.network.subnet_public_one_id
  private_instance_ami  = var.private_instance_ami
  private_instance_type = var.private_instance_type
  private_subnet_id     = module.network.subnet_private_one_id
  vpc_id                = module.network.vpc_id
  lb_subnets            = [module.network.subnet_public_one_id, module.network.subnet_public_two_id]
}

module "database" {
  source                = "./Modules/Databases"
  redis_node_type       = var.redis_node_type
  redis_num_cache_nodes = var.redis_num_cache_nodes
  redis_subnet_ids      = [module.network.subnet_private_two_id]
  vpc_id                = module.network.vpc_id
  rds_engine            = var.rds_engine
  rds_username          = var.rds_username
  rds_password          = var.rds_password
  rds_subnet_gp_name    = module.network.private_subnet_gp_name
}