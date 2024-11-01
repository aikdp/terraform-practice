
#Giving Revese order which means 1st instance code and 2nd security group code

resource "aws_instance" "terraform" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags  = var.tags
}
resource "aws_security_group" "allow_ssh_terraform" {
    name = var.sg_name  #here alerady allow ssh SG is there in aws account
    description = var.sg_description

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = var.ingress_from_port
        to_port = var.ingress_to_port
        protocol = var.ingress_protocol
        cidr_blocks = var.ingress_cidr     #example:allow everyone
        ipv6_cidr_blocks = ["::/0"]
    }

       tags  = var.tags
}


