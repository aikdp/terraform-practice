#Requirementsa are: 3 instances and 3 r53 records 
# backend.telugudevops.online—>t3.micro
# mysql.telugudevops.online –>t3.small
# telugudevops.onlinet3.micro
resource "aws_route53_record" "expense-1" {
  count           = length(var.instance_names)
  zone_id         = var.zone_id
  name            = var.instance_names[count.index] == "frontend" ? "${var.domain_name}" : "${var.instance_names[count.index]}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = var.instance_names[count.index] == "frontend" ? [aws_instance.expense-1[count.index].public_ip] : [aws_instance.expense-1[count.index].private_ip]
  allow_overwrite = true
}

#Interpolation  
#"${var.instance_names[count.index]}.${var.domain_name}