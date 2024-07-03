resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxxxxx" # Update with appropriate AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.pri.id
  security_groups = [aws_security_group.sg.name]
  tags = {
    Name = "WebServer"
  }
  user_data = <<-user
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              user
}

resource "aws_instance" "db" {
  ami           = "ami-xxxxxxxxxxx" # Update with appropriate AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.pri.id
  security_groups = [aws_security_group.db_sg.name]
  tags = {
    Name = "DatabaseServer"
  }
  user_data = <<-dbuser
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y postgresql postgresql-contrib
              sudo -u postgres psql -c "CREATE DATABASE myapp;"
              sudo -u postgres psql -c "CREATE USER myappuser WITH PASSWORD 'password';"
              sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE myapp TO myappuser;"
              dbuser
}