output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_public_one_id" {
  value = aws_subnet.public_subnets["public_one"].id
}

output "subnet_public_two_id" {
  value = aws_subnet.public_subnets["public_two"].id
}

output "subnet_private_one_id" {
  value = aws_subnet.private_subnets["private_one"].id
}

output "subnet_private_two_id" {
  value = aws_subnet.private_subnets["private_two"].id
}


output "private_subnet_gp_name" {
  value = aws_db_subnet_group.private_subnet_gp.name
}