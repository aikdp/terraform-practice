#Requirementsa are: 3 instances and 3 r53 records 
# backend.telugudevops.online—>t3.micro
# mysql.telugudevops.online –>t3.small
# telugudevops.onlinet3.micro

#Checking locals and comment variables folders
resource "aws_instance" "expense-1" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.ami_info.id
  instance_type          = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_expense-1.id]

  tags = {
    Name = var.instance_names[count.index]
  }
}
#2nd instance used for LOCALS and give condition in locals.tf beacuse it is not good to see in this instances 
#For example: we can use create another instances with if environment is prod create t3.medium, otherwise t3.micro
resource "aws_instance" "elasticsearch" {
  ami                    = data.aws_ami.ami_info.id
  #  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"  it is not good to config here, instead palce at locals.tf
  instance_type          = local.instance_type  #give instance_type which is key
  vpc_security_group_ids = [aws_security_group.allow_ssh_expense-1.id]

  tags = {
    Name = "elatstic-local"
  }
}

#Creating Security group
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
