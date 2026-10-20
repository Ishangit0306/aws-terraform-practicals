output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "URL of the deployed webpage"
  value       = "http://${aws_instance.web.public_ip}"
}