locals {
    domain_name = "telugudevops.online"
    zone_id     =  "Z0873413X28XY5FKMLIP"
    instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
}
