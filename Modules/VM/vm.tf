resource "aws_instance" "public_vm" {

  ami                         = var.public_instance_ami
  instance_type               = var.public_instance_type
  associate_public_ip_address = var.public_ip_addres
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  key_name                    = var.private_key
  tags = {
    Name = var.public_instance_name
  }

  provisioner "local-exec" { # excute only with first creation
    command = "echo ${self.public_ip}"
  }
}

resource "aws_instance" "private_vm" {

  ami                         = var.private_instance_ami
  instance_type               = var.private_instance_type
  associate_public_ip_address = var.private_public_ip_addres
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  key_name                    = var.private_key
  # user_data = <<-EOF
  #     #!/bin/bash
  #     sudo apt-get update -y
  #     sudo apt-get install nginx -y
  #     sudo service nginx start
  #     sudo systemctl enable nginx
  #     EOF
  tags = {
    Name = var.private_instance_name
  }

  provisioner "local-exec" { # excute only with first creation
    command = "echo ${self.public_ip}"
  }
}

