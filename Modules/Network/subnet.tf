locals {
  subnets = {
    public_one = {
      availability_zone       = var.az_subnet_pb_one
      subnet_cidr_block       = "10.0.0.0/24"
      subnet_name             = "public-one"
      map_public_ip_on_launch = true
    },
    public_two = {
      availability_zone       = var.az_subnet_pb_two
      subnet_cidr_block       = "10.0.2.0/24"
      subnet_name             = "public-two"
      map_public_ip_on_launch = true
    },
    private_one = {
      availability_zone       = var.az_subnet_pr_one
      subnet_cidr_block       = "10.0.1.0/24"
      subnet_name             = "private-one"
      map_public_ip_on_launch = false
    },
    private_two = {
      availability_zone       = var.az_subnet_pr_two
      subnet_cidr_block       = "10.0.3.0/24"
      subnet_name             = "private-two"
      map_public_ip_on_launch = false
    }
  }

  private_subnets = {
    for key, subnet in local.subnets :
    key => subnet if subnet.map_public_ip_on_launch == false
  }

  public_subnets = {
    for key, subnet in local.subnets :
    key => subnet if subnet.map_public_ip_on_launch == true
  }
}

resource "aws_subnet" "private_subnets" {
  for_each          = local.private_subnets
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.subnet_cidr_block
  tags = {
    Name = each.value.subnet_name
  }
}

resource "aws_subnet" "public_subnets" {
  for_each          = local.public_subnets
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.subnet_cidr_block
  tags = {
    Name = each.value.subnet_name
  }
}

# subnet group
resource "aws_db_subnet_group" "private_subnet_gp" {
  name = "private_subnet gp"
  subnet_ids = [
    aws_subnet.private_subnets["private_one"].id,
    aws_subnet.private_subnets["private_two"].id
  ]

  tags = {
    Name = "RDS subnet group"
  }
}