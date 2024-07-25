locals {
  server_ec2     = 3
  rancher_server = 1

}

data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "server_ec2" {
  count = local.server_ec2

  ami           = data.aws_ami.this.id
  instance_type = "t2.medium"
  vpc_security_group_ids = [var.vpc_security_group_ids]
  subnet_id     = var.subnet_id

 
  tags          = merge({ Name = "server-${count.index}" }, var.tags)
}

resource "aws_instance" "rancher-server_ec2" {
  count = local.rancher_server

  ami           = data.aws_ami.this.id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  subnet_id     = var.subnet_id

  instance_type = "t2.medium"
  tags          = merge({ Name = "rancher-${count.index}" }, var.tags)
}
