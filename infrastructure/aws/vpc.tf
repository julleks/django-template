  resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-${var.project_name}"
    Project = var.project_name
    Terraform = true
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-internet-gateway"
    Project = var.project_name
    Terraform = true
  }
}

resource "aws_security_group" "sg_postgres" {
  name = "${var.project_name}-security-group-postgres"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-security-group-postgres"
    Project = var.project_name
    Terraform = true
  }
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_a_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a-${var.project_name}"
    Project = var.project_name
    Terraform = true
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_b_cidr
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b-${var.project_name}"
    Project = var.project_name
    Terraform = true
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_c_cidr
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-c-${var.project_name}"
    Project = var.project_name
    Terraform = true
  }
}
#
#resource "aws_subnet" "private_subnet_a" {
#  vpc_id = aws_vpc.vpc.id
#  cidr_block = var.private_subnet_a_cidr
#  availability_zone = "${var.region}a"
#  map_public_ip_on_launch = false
#
#  tags = {
#    Name = "public-subnet-a-${var.project_name}"
#    Project = var.project_name
#    Terraform = true
#  }
#}
#
#resource "aws_subnet" "private_subnet_b" {
#  vpc_id = aws_vpc.vpc.id
#  cidr_block = var.private_subnet_b_cidr
#  availability_zone = "${var.region}a"
#  map_public_ip_on_launch = false
#
#  tags = {
#    Name = "public-subnet-b-${var.project_name}"
#    Project = var.project_name
#    Terraform = true
#  }
#}
#
#resource "aws_subnet" "private_subnet_c" {
#  vpc_id = aws_vpc.vpc.id
#  cidr_block = var.private_subnet_c_cidr
#  availability_zone = "${var.region}a"
#  map_public_ip_on_launch = false
#
#  tags = {
#    Name = "public-subnet-c-${var.project_name}"
#    Project = var.project_name
#    Terraform = true
#  }
#}

resource "aws_db_subnet_group" "rds_subnet" {
  name = "rds-subnet-${var.project_name}"
  subnet_ids = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id, aws_subnet.public_subnet_c.id]

  tags = {
    Name = "rds-subnet-${var.project_name}"
    Project = var.project_name
    Terraform = true
  }
}
