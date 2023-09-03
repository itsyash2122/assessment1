# Creating Public Route Table 
resource "aws_route_table" "public_rt" {
    vpc_id = "${aws_vpc.notes_vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.notes_internet_gateway.id}"
    }

    tags = {
        Name = "public_rt"
        Task = "Assessment1"
    }
}


resource "aws_eip" "nat-gateway-eip" {
  depends_on = [
    aws_route_table_association.public-rta1
  ]
  vpc = true
}
# Creating a NAT Gateway!
resource "aws_nat_gateway" "notes_nat_gateway" {
  depends_on = [
    aws_eip.nat-gateway-eip
  ]

  # Allocating the Elastic IP to the NAT Gateway!
  allocation_id = aws_eip.nat-gateway-eip.id
  
  # Associating it in the Public Subnet!
  subnet_id = aws_subnet.public-subnet-1.id
  tags = {
    Name = "notes_natgw"
    Task = "Assessment1"
  }
}
# Creating a Route Table for the Nat Gateway!
resource "aws_route_table" "nat-gateway-rt" {
 
  vpc_id = aws_vpc.notes_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.notes_nat_gateway.id
  }

  tags = {
    Name = "nat-gateway-rt"
    Task = "Assessment1"
  }

}
# Associating Route Table
resource "aws_route_table_association" "public-rta1" {
    subnet_id = "${aws_subnet.public-subnet-1.id}"
    route_table_id = "${aws_route_table.public_rt.id}"

}

# Associating Route Table
resource "aws_route_table_association" "public-rta2" {
    subnet_id = "${aws_subnet.public-subnet-2.id}"
    route_table_id = "${aws_route_table.public_rt.id}"


}


# Creating an Route Table Association of the NAT Gateway route 
# table with the Private Subnet!
resource "aws_route_table_association" "nat-gateway-rta1" {
  depends_on = [
    aws_route_table.nat-gateway-rt
  ]

#  Private Subnet ID for adding this route table to the DHCP server of Private subnet!
  subnet_id      = aws_subnet.private-subnet-1.id

# Route Table ID
  route_table_id = aws_route_table.nat-gateway-rt.id

}

resource "aws_route_table_association" "nat-gateway-rta2" {
  depends_on = [
    aws_route_table.nat-gateway-rt
  ]

#  Private Subnet ID for adding this route table to the DHCP server of Private subnet!
  subnet_id      = aws_subnet.private-subnet-2.id

# Route Table ID
  route_table_id = aws_route_table.nat-gateway-rt.id
}