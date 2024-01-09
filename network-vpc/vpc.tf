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



