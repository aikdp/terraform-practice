# resource "aws_security_group" "sg_allow-ssh" {
#   name   = "Port-SSH"
#   description = "allow port no 22 traffic"


#     egress {
#         from_port        = 0
#         to_port          = 0
#         protocol         = "-1"
#         cidr_blocks      = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }

#     ingress {
#         from_port        = 22
#         to_port          = 22
#         protocol         = "tcp"
#         cidr_blocks      = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }

#      ingress {
#         from_port        = 8080
#         to_port          = 8080
#         protocol         = "tcp"
#         cidr_blocks      = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }
#      ingress {
#         from_port        = 3306
#         to_port          = 3306
#         protocol         = "tcp"
#         cidr_blocks      = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }
#      ingress {
#         from_port        = 2049
#         to_port          = 2049
#         protocol         = "tcp"
#         cidr_blocks      = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#     }
#     tags = {
#         Name = "SSH-Port"
#     }
# }




resource "aws_security_group" "sg_allow-ssh" {
  name   = "Port-SSH-dynamic"
  description = "allow port no 22 traffic"

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        # ipv6_cidr_blocks = ["::/0"]
    }

#Terraform will give us variable with block name
    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port        = ingress.value["from_port"]
            to_port          = ingress.value["to_port"]
            protocol         = ingress.value["protocol"]
            cidr_blocks      = ingress.value.cidr_blocks    #we also give like this 
         }
    }

    tags = {
        Name = "SSH-Port-dynamic"
    }

}