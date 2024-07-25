locals {
  az_letter  = ["a", "b", "c", "d", "e", "f"]
  cidr_block = var.vpc_cidr_block
}

data "aws_region" "current" {}


resource "aws_vpc" "this" {
  cidr_block = local.cidr_block

  tags = merge(var.tags, {
    Name = "vpc-default-k8s"
  })

  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "this" {
  count = var.total_subnets

  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.${count.index}.0/24"
  availability_zone       = "${data.aws_region.current.name}${element(local.az_letter, count.index)}"
  map_public_ip_on_launch = true


  tags = merge(var.tags, {
    Name = "subnet-${count.index}"
  })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.tags, {
    Name = "igw-k8s"
  })

}
