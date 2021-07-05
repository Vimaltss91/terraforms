provider "aws" {
  region = "ap-south-1"
}

variable "subnet_cidr_block" {
 
}

resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "name" = "dev-vpc"
  }
}

resource "aws_subnet" "name" {
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "ap-south-1a"
    tags = {
    "name" = "dev-subnet"
  }
}

output "subnetid" {
  value = aws_vpc.dev_vpc.id
}

data "aws_vpc" "existing" {
  default = true
}