variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
  description = "Creating instances using locals"
}

# variable "zone_id" {
#   default = "Z0873413X28XY5FKMLIP"
# }
# variable "domain_name" {
#   default = "telugudevops.online"
# }
variable "environment" {
  default = "prod" 
}