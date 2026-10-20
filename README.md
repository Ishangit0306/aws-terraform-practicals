# AWS & Terraform Practicals

Hands-on AWS infrastructure projects built using Terraform.

## Projects

### Practical 1: EC2 and Static Website
- Provision an EC2 instance using Terraform.
- Configure a security group for HTTP access.
- Install Nginx using EC2 user data.
- Deploy a static HTML webpage.

### Practical 2: Custom VPC and EC2
- Create a custom VPC and public subnets.
- Configure an Internet Gateway and route tables.
- Deploy an EC2 instance inside the custom VPC.

### Practical 3: Application Load Balancer
- Extend the VPC and EC2 infrastructure from Practical 2.
- Configure an Application Load Balancer and target group.
- Serve the static website through the load balancer.

## Technologies
- AWS
- Terraform
- Amazon Linux 2023
- Nginx
- Git and GitHub

## Usage
Each practical contains its own Terraform configuration and README.

Review the Terraform plan before applying changes. Never commit AWS credentials, private keys, or Terraform state files.

## Cleanup
Run `terraform destroy` from the relevant practical directory when you no longer need its infrastructure.

