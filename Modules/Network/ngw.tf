resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.public_subnets["public_one"].id
  allocation_id = aws_eip.nat_eip.id
  tags = {
    Name = var.nat_name
  }
}