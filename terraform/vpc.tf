# Creating VPC
resource "aws_vpc" "notes_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "notes_vpc"
  }
}