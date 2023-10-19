output "dns_name" {
  description = "The DNS name of the load balancer."
  value       = "http://${aws_lb.load_balancer.dns_name}"
}