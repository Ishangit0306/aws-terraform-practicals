resource "aws_security_group" "web_sg" {
  name        = "terraform-practical-1-web-sg"
  description = "Allow HTTP and SSH access"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.219.144.234/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-practical-1-web-sg"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-USERDATA
    #!/bin/bash
    dnf install -y nginx
    systemctl enable --now nginx

    cat > /usr/share/nginx/html/index.html <<'HTML'
    <!DOCTYPE html>
    <html>
      <head>
        <title>My First Terraform Project</title>
      </head>
      <body>
        <h1>Hello from AWS EC2!</h1>
        <p>This static webpage was deployed using Terraform.</p>
      </body>
    </html>
    HTML
  USERDATA

  tags = {
    Name = "terraform-practical-1-web"
  }
}