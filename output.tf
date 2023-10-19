output "dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.tf_LB.dns_name
}
output "instance_ip" {
  value = module.tf_ec2.instance_public_ips
}