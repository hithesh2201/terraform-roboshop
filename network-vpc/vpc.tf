resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames=true
  tags={
    Name="${local.project_name}-vpc"
    env= local.env
  }
}
resource "aws_subnet" "public" {
  count=length(var.public_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.availabilty_zones[count.index]

  tags = {
    Name = "${local.project_name}-public-${var.availabilty_zones[count.index]}"
  }
}
resource "aws_subnet" "private" {
  count=length(var.private_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr[count.index]
  availability_zone = var.availabilty_zones[count.index]

  tags = {
    Name = "${local.project_name}-private-${var.availabilty_zones[count.index]}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.project_name}-igw"
  }
}
resource "aws_eip" "main" {

  domain   = "vpc"
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
}
resource "aws_route" "private" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.gw.id
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public-route-table"
  }
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-route-table"
  }
}
resource "aws_route_table_association" "public-subnet" {
  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-subnet" {
  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.private.id
}