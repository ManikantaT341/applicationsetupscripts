# DevOps Task
This project sets up a private network on AWS, provisions two EC2 instances (one for a web application and one for a PostgreSQL database), configures secure communication, and automates the setup using Terraform.
# Prerequisites
- AWS account with necessary permissions
- Terraform installed
- AWS CLI configured
# 1. Clone the Repository
Clone this repository to your local machine and navigate to the directory.
git clone <repository_url>
cd <repository_directory>

# configure aws cli
aws configure

# initialize and apply terraform configuration
terraform init
terraform plan
terraform apply