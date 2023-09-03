# Creating Internet Gateway 
resource "aws_internet_gateway" "notes_internet_gateway" {
  vpc_id = "${aws_vpc.notes_vpc.id}"

  tags = {
    Name = "notes_igw"
    Task = "Assessment1"
  }
}