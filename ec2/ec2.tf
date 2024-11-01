#1
# Creating aws security group using terraform
# resource "aws_security_group" "allow_ssh_terraform" {
#     name = "allow_ssh_port"  #here alerady allow ssh SG is there in aws account
#     description = "allow port 22 for ssh access"

# egress or outbound or outgoing traffic
#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }

# ingress or inbound or incoming traffic
#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]     #example:allow everyone
#         ipv6_cidr_blocks = ["::/0"]
#     }

# tags are nothing but giveing "Name" tag to security group
#     tags = {
#         Name = "Allow-SSH-PORT"
#     }
# }

# This is another block and creating aws instance using terraform code
# resource "aws_instance" "terraform" {
#     ami = "ami-09c813fb71547fc4f"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

#     tags  = {
#         Name = "terraform"    #Tagging Name as "terraform"--> tag nothing but Name of the instance
#     }
# }

#2
#Giving Revese order which means 1st instance code and 2nd security group code

# resource "aws_instance" "terraform" {
#     ami = "ami-09c813fb71547fc4f"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

#     tags  = {
#         Name = "terraform"
#     }
# }
# resource "aws_security_group" "allow_ssh_terraform" {
#     name = "allow_ssh_port"  #here alerady allow ssh SG is there in aws account
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

#     tags = {
#         Name = "Allow-SSH-PORT"
#     }
# }


#when you perform terraform plan, it 1st creates security group

#3
#below code for practcing

resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = {
        Name = "Terraform_server"
    }
} 
resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow-port-22"
    description = "Allow port 22 for ssh access"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "Terraform_SG_SSH"
    }
}
