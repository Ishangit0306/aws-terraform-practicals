
output "vpc_id" {
  description = "ID of the custom VPC"
  value       = aws_vpc.main.id
}

output "subnet_a_id" {
  description = "ID of public subnet A"
  value       = aws_subnet.public_a.id
}

output "subnet_b_id" {
  description = "ID of public subnet B"
  value       = aws_subnet.public_b.id
}

output "instance_id" {
  description = "ID of the web server"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IPv4 address of the web server"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "URL of the web server"
  value       = "http://${aws_instance.web.public_ip}"
}


output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.web.dns_name
}

output "alb_url" {
  description = "URL of the Application Load Balancer"
  value       = "http://${aws_lb.web.dns_name}"
}
