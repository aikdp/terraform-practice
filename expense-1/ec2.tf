#Requirementsa are: 3 instances and 3 r53 records 
# backend.telugudevops.online—>t3.micro
# mysql.telugudevops.online –>t3.small
# telugudevops.onlinet3.micro

resource "aws_instance" "expense-1" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.ami_info.id
  instance_type          = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_expense-1.id]

  tags = {
    Name = var.instance_names[count.index]
  }
}
resource "aws_security_group" "allow_ssh_expense-1" {
  name        = "allow-port-SSH"
  description = "Allow port 22 for ssh access"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Terraform_SG_SSH"
  }
}
