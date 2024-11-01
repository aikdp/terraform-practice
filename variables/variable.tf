variable "ami_id" {         #ami vars
    default = "ami-09c813fb71547fc4f"
}
variable "instance_type" {      #instance type vars
    type = string
    default = "t3.micro"
}
variable "tags" {
    type = map #optiional terraform know that, tag is by default map
    default = {
        Name = "backend"        	# in tags, first letter should CAPS
        Project = "expense"
        Component = "backend"
        Environment = "dev"
        Terraform  = "ture"
    }

}
variable "sg_name" {
    default = "allow-ssh-port"
}

variable "sg_description" {
    default = "allow port 22 for ssh access"
}
variable "ingress_from_port" {
    type = number
    default = 22
}
variable "ingress_to_port" {
    type = number
    default = 22
}

variable "ingress_protocol" {
    default = "tcp"
}

variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}