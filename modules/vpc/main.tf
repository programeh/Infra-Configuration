resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

data "aws_availability_zones" "availability_zones"{}

resource "aws_subnet" "public_subnet_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "publicsubnet1"
  }
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "publicsubnet2"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "publicroute"
  }
}

resource "aws_route_table_association" "public_subnet_az1_routetable_association" {
  subnet_id = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_az2_routetable_association" {
  subnet_id = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "private_subnet_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "privatesubnet1"
  }
}

resource "aws_subnet" "private_subnet_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "privatesubnet2"
  }
}
# create private data subnet az1
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_data_subnet_az1_cidr
  availability_zone        = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "privatedatasubnet1"
  }
}

# create private data subnet az2
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_data_subnet_az2_cidr
  availability_zone        = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "privatedatasubnet2"
  }
}
