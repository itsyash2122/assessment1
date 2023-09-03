# Creating RDS Instance
resource "aws_db_subnet_group" "notes-subnet-db" {
  name       = "main"
  subnet_ids = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]

  tags = {
    Name = "notes subnet group"
    Task = "Assessment1"
  }
}

resource "aws_db_instance" "notes-rds" {
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.notes-subnet-db.id
  engine                 = "mysql"
  identifier             = "notes-rds"
  engine_version         = "8.0.33"
  instance_class         = "db.t3.small"
  multi_az               = true
  name                   = "notesdb"
  username               = "notes_user"
  password               = "YSHDNAJDAdha"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.notes-rds-sg.id]

   tags = {
    Name = "notes subnet group"
    Task = "Assessment1"
  }

}