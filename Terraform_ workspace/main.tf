provider "aws" {
  region     = var.aws_region

}
data "aws_ami" "Linux_ami" {
  most_recent = true
  filter { #filter is a dictionary. The filter will go in AWS and fetch the latest ami. AWs 
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
  owners = ["amazon"]
}

resource "aws_vpc" "terra-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "terra-vpc"
  }
}
resource "aws_internet_gateway" "terra-igw" {
  vpc_id = aws_vpc.terra-vpc.id
  tags = {
    Name = "terra-igw"
  }
}

# create public and private subnets
resource "aws_subnet" "terra-pub-sub1" {
  vpc_id            = aws_vpc.terra-vpc.id
  cidr_block        = var.terra_pub_sub1_Cidr
  availability_zone = var.terra_pub_az

  tags = {
    Name = "terra-pub-sub1"
  }
}
resource "aws_subnet" "terra-priv-sub1" {
  vpc_id            = aws_vpc.terra-vpc.id
  cidr_block        = var.terra_priv_sub1_Cidr
  availability_zone = var.terra_priv_az

  tags = {
    Name = "terra-priv-sub1"
  }
}

# create public route table
resource "aws_route_table" "pub-terra-rt" {
  vpc_id = aws_vpc.terra-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra-igw.id
  }

  tags = {
    Name = "Public Route Table."
  }
}

resource "aws_route_table_association" "pub-terra-rt" {
  subnet_id      = aws_subnet.terra-pub-sub1.id
  route_table_id = aws_route_table.pub-terra-rt.id
}

# create private route table
resource "aws_route_table" "priv-terra-rt" {
  vpc_id = aws_vpc.terra-vpc.id
}
locals {
  instance_name = "${terraform.workspace} - instance"
  
}
resource "aws_instance" "linux_instance" {
  ami                    = data.aws_ami.Linux_ami.id
  instance_type          = var.instance_type
  key_name               = var.instance_key_pair
  tags = {
    Name = local.instance_name
}
}
