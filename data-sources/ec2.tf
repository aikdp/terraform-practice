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

    tags = {
        Name = "SSH-Port"
    }
}

resource "aws_instance" "terraform" {
  ami = data.aws_ami.devops.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg_allow-ssh.id]
  tags = {
    Name = "terraform"
  }
}
