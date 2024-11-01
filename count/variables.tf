variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend", "KDP"]
}
variable "common_tags" {
    type = map              #by default tag is map
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}