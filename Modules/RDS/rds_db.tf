resource "aws_db_instance" "rds" {
  # Allocating the storage for database instance.
  allocated_storage = var.rds_allocated_storage 
  # Declaring the database engine and engine_version
  engine         = var.rds_engine
  engine_version = var.rds_engine_version
  # Declaring the instance class
  instance_class = var.rds_instance_class
  db_name        = var.rds_db_name
  # User to connect the database instance 
  username = var.rds_username
  # Password to connect the database instance 
  password             = var.rds_password
  parameter_group_name = var.rds_parameter_group_name

  # private subnet group
  db_subnet_group_name   = var.rds_subnet_gp_name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  # to delete database when destroy
  skip_final_snapshot     = var.rds_skip_final_snapshot 
  backup_retention_period = var.rds_backup_retention_period 
}



# to pass username and password to terraform code 

# > terraform apply -var 'rds_username=admin123' -var 'rds_password=password123'


# To try to connect to rds from private instance

# mysql -h <rds-endpoint> -P <port> -u <username> -p
# mysql -h terraform-20230520192957262800000003.ceu81qx84oqx.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p