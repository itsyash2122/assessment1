# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "bastion" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "notes_bastion"
  vpc_security_group_ids      = ["${aws_security_group.notes_sg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-1.id}"
  associate_public_ip_address = true

  tags = {
    Name = "Bastion"
    Task = "Assessment1"
  }
}

# Creating  EC2 instance in Public Subnet
resource "aws_instance" "frontend" {
  ami                         = "ami-0261755bbcb8c4a84"
  instance_type               = "t2.small"
  count                       = 1
  key_name                    = "notes_frontend"
  vpc_security_group_ids      = ["${aws_security_group.notes_sg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-1.id}"
  user_data                   = "${file("data.sh")}"
  associate_public_ip_address = true
  tags = {
    Name = "notes_fb"
    Task = "Assessment1"
  }
}

