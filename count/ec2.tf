
# instances are with same name

# resource "aws_instance" "backend" {
#     count = 3
#     ami = "ami-09c813fb71547fc4f"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

#     tags  = {
#         Name = "backend"
#     }
# }
# resource "aws_security_group" "allow_ssh_terraform" {
#     name = "allow-ssh-port"  #here alerady allow ssh SG is there in aws account
#     description = "allow port 22 for ssh access"

#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }

#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]     #example:allow everyone
#         ipv6_cidr_blocks = ["::/0"]
#     }

#        tags  = {
#         Name = "Allow-SSH-port"
#        }
# }


#2 Count 3 with different names but mentioning count values

# resource "aws_instance" "backend" {
#     count = 3
#     ami = "ami-09c813fb71547fc4f"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

#     tags  = {
#         Name = var.instance_names[count.index]
#     }
# }
# resource "aws_security_group" "allow_ssh_terraform" {
#     name = "allow-ssh-port"  #here alerady allow ssh SG is there in aws account
#     description = "allow port 22 for ssh access"

#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }

#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]     #example:allow everyone
#         ipv6_cidr_blocks = ["::/0"]
#     }

#        tags  = {
#         Name = "Allow-SSH-port"
#        }
# }

#3 Using count length, will get the length

# resource "aws_instance" "backend" {
#     count = length(var.instance_names)
#     ami = "ami-09c813fb71547fc4f"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

#     tags  = {
#         Name = var.instance_names[count.index]
#     }
# }
# resource "aws_security_group" "allow_ssh_terraform" {
#     name = "allow-ssh-port"  #here alerady allow ssh SG is there in aws account
#     description = "allow port 22 for ssh access"

#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }

#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]     #example:allow everyone
#         ipv6_cidr_blocks = ["::/0"]
#     }

#        tags  = {
#         Name = "Allow-SSH-port"
#        }
# }


#Functions 
resource "aws_instance" "backend" {
    count = length(var.instance_names)
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags  = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
}
resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow-ssh-port"  #here alerady allow ssh SG is there in aws account
    description = "allow port 22 for ssh access"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]     #example:allow everyone
        ipv6_cidr_blocks = ["::/0"]
    }

       tags  = merge(
        var.common_tags,
        {
            Name = "allow-sshhh"
        }
       )
}