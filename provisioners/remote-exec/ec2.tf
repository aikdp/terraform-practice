resource "aws_security_group" "sg_allow-ssh" {
  name   = "Port-SSH"
  description = "allow port no 22 traffic"


    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
   ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
        Name = "SSH-Port"
    }
}

#AWS instance Creation
resource "aws_instance" "terraform" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg_allow-ssh.id]
  tags = {
    Name = "terraform"
  }
#For remote exec; need conection block
connection {
  type     = "ssh"
  user     = "ec2-user"
  password = var.ec2_password
  host     = self.public_ip
}

#Creation time Provision: Provisioners will execute at the timw resource creation
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
}
#Destroy time provision: it run at destroy time
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx",
    ]
}
}
