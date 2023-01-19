output "publicec2public_ip" {
  value = aws_instance.ec2_instance.public_ip
}
output "publicec2private_ip" {
  value = aws_instance.ec2_instance.private_ip
}
output "privateec2private_ip" {
  value = aws_instance.ec2_instance_priv.private_ip
}