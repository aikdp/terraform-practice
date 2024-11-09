variable "image_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Componenet = "frontend"
        Environment = "Dev"
        Terraform = "Yes"
    }
}

variable "sg_name" {
    default = "Port-SSH"
}

variable "sg_desc" {
    default = "allow port no 22 traffic"
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "environment" {
    default = "prod"
}

variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

# variable "common_tags" {
#     type = map
#     default = {
#         Project = "expense"
#         componenet = "frontend"
#         Environment = "dev"
#     }
# }