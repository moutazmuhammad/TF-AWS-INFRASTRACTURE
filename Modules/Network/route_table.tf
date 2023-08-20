resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.public_route_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.public_route_name
  }
}

resource "aws_route_table_association" "public_route_assocate" {
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route.id
}




resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.private_route_cidr_block
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = var.private_route_name
  }
}

resource "aws_route_table_association" "private_route_assocate" {
  subnet_id      = aws_subnet.private_subnets["private_one"].id
  route_table_id = aws_route_table.private_route.id
}
