#We need to below records
#mysql.telugudevops.onlinepvt ip
# backend.telugudevops.onlinepvt ip
# telugudevops.onliepub ip


# resource "aws_route53_record" "expense" {
#   count = length(var.instance_names)
#   zone_id = var.zone_id
#   name    = "${var.instance_names[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.expense[count.index].private_ip]
#   allow_overwrite = true
# }


resource "aws_route53_record" "expense" {
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    = var.instance_names[count.index] == "frontend" ? "${var.domain_name}" : "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}