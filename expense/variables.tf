variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}
variable "common_tags" {
    type = map              #by default tag is map
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}
variable "zone_id" {
    default = "Z0873413X28XY5FKMLIP"
}
variable "domain_name" {
    default = "telugudevops.online"
}