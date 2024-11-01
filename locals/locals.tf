#loacl can store expression and intermediate values,so when u use local write conditiins in it.

# 1.	Variables and locals both can store values, but locals can have some extra capabilities
# 2.	Locals can store expressions, terraform can run them and get the value
# 3.	Locals can use variables inside. Variables cannot refer locals.
# 4.	We can override variables, cannot override locals

locals {
    domain_name = "telugudevops.online"
    zone_id = "Z0873413X28XY5FKMLIP" #but count.index will not work in locals
    #For example: we can use create another instances with if environment is prod create t3.medium, otherwise t3.micro
    instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
}