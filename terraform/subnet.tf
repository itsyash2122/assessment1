resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = "${aws_vpc.notes_vpc.id}"
  cidr_block             = "${var.subnet_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet 1"
    Task = "Assessment1"
  }
}


resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = "${aws_vpc.notes_vpc.id}"
  cidr_block             = "${var.subnet1_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private Subnet 1"
    Task = "Assessment1"
  }
}


resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = "${aws_vpc.notes_vpc.id}"
  cidr_block             = "${var.subnet3_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public Subnet 2"
    Task = "Assessment1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = "${aws_vpc.notes_vpc.id}"
  cidr_block             = "${var.subnet2_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private Subnet 2"
    Task = "Assessment1"
  }
}


