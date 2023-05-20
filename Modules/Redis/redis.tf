resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.redis_cluster_id
  engine               = var.redis_engine
  node_type            = var.redis_node_type
  num_cache_nodes      = var.redis_num_cache_nodes
  parameter_group_name = var.redis_parameter_group_name
  engine_version       = var.redis_engine_version
  port                 = var.redis_port
  security_group_ids   = [aws_security_group.redis_sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.cache_sub_grp.id
}

resource "aws_elasticache_subnet_group" "cache_sub_grp" {
  name       = "cache-subnet-grp"
  subnet_ids = var.redis_subnet_ids
}


# To try to connect to redis from private instance

# redis-cli -h  [host_name] -p [port=6379]
# redis-cli -h redis-cluster.cpmsn7.0001.euw1.cache.amazonaws.com -p 6379