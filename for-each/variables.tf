variable "instances" {
    type = map
    default = {
        mysql = "t3.small"   #key  =  value -->key value pair
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}


variable "zone_id" {
    default = "Z0873413X28XY5FKMLIP"
}

variable "domain_name" {
    default = "telugudevops.online"
}