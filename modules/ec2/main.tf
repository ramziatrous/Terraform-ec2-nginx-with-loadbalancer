
resource "aws_instance" "main" {
  count                  = length(var.subnet_id)
  ami                    = var.ec2_instance_ami
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = var.subnet_id[count.index]
  tags = {
    Name = var.ec2_instance_name
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt upgrade -y
              sudo apt install nginx -y
              sudo echo "<h1>Hello from Terraform My IP Address is : $(curl https://ipinfo.io/ip)</h1>" > /var/www/html/index.html
  EOF
}


resource "aws_security_group" "sg" {
  name        = "tf_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}