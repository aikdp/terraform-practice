output "image_name" {
    value = data.aws_ami.devops.image_id
}

output "sg_id" {
    value = aws_security_group.sg_allow-ssh.id
}