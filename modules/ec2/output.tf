output "sg_id" {
  value = aws_security_group.sg.id
}
output "ec2_id" {
  value = aws_instance.main.*.id

}
output "instance_public_ips" {
  value = aws_instance.main.*.public_ip
}