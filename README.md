# **🛒 GroceryMate: Cloud-Native AWS Deployment**

## ```📌 Project Overview```
This repository details the deployment of GroceryMate, a Python/Flask-based web application, into a highly available, cloud-native AWS architecture.

The project demonstrates the evolution of a monolithic application into a decoupled, containerized system. By leveraging Docker for compute consistency, Amazon RDS for managed relational data, Amazon S3 for scalable object storage, and an Elastic Load Balancer (ELB) for traffic distribution, this architecture is designed for security, scalability, and performance.

## ```🏗️ Architecture Flow```
The application follows a standard three-tier cloud architecture model:

1. Traffic Routing: Users access the application via an Application Load Balancer (ALB), which distributes incoming HTTP traffic across multiple Availability Zones.
2. Compute Tier: The Flask application runs securely inside a Docker Container hosted on Amazon Linux EC2 instances. The container utilizes network host to seamlessly integrate with the EC2 network stack.
3. Database Tier: Relational data (users, products, orders) is managed by a private Amazon RDS (PostgreSQL) instance.
4. Storage Tier: Static assets and user-uploaded media (e.g., avatars) are stored dynamically in an Amazon S3 bucket.
5. Logic Tier:** An **AWS Lambda** function handles the "Cloud Discount" logic, triggered by the React frontend via a secure **Lambda Function URL**.

## 🤖 Infrastructure as Code (IaC)
The entire environment is codified using **Terraform**, ensuring the environment is 100% reproducible and portable.

### Key IaC Improvements:
* **Network Isolation:** Defined a custom VPC with Public Subnets (Compute) and Private Subnets (RDS) using explicit **Route Tables**.
* **Security Groups:** Implemented "Least Privilege" access. The RDS instance only accepts traffic from the EC2 Security Group on port 5432.
* **Serverless Logic:** The AWS Lambda function is fully codified, including IAM execution roles and Public Function URL configuration.
* **IAM Instance Profiles:** EC2 instances are granted S3 and Lambda access via IAM Roles, eliminating the need for hardcoded AWS Access Keys.
* **Zero Hardcoding:** All environment-specific values (AMI IDs, CIDR blocks, naming conventions) are managed via `variables.tf`.

## ⚡ Featured Cloud Integration: AWS Discount Service
To demonstrate cloud-native automation, I integrated a **Python-based AWS Lambda** function.

* **Function:** `grocerymate-discount-service`
* **Trigger:** A dedicated "Apply AWS Discount" button in the React frontend.
* **Impact:** Decouples business logic (pricing/discounts) from the core application, allowing for independent scaling and updates without redeploying the main server.

## ```🚀 Key Milestones & Evolution```
1. Manual Provisioning: Initial deployment on a bare-metal Amazon Linux instance, configuring Python, Git, and PostgreSQL manually.
2. Containerization: Authored a Dockerfile to package the application, ensuring consistency across local and cloud environments.
3. Database Decoupling: Migrated the local PostgreSQL database to a fully managed AWS RDS instance inside a private subnet.
4. Storage Decoupling: Transitioned avatar file storage from the local EC2 filesystem to Amazon S3.
5. High Availability: Placed the compute instances behind an Elastic Load Balancer.

## ```🔐 Security Best Practices Implemented```
1. IAM Roles over Credentials: The application accesses Amazon S3 via an attached EC2 IAM Role (AmazonS3FullAccess scoped down to specific buckets) rather than hardcoding AWS Access Keys in environment variables.
2. Network Isolation: The RDS database is placed in a private subnet and is only accessible from the EC2 instance's specific Security Group.
3. AWS SSO: Infrastructure management and CLI interactions are authenticated securely using AWS Single Sign-On (SSO) rather than legacy IAM users.

## ```🛠️ Prerequisites```
To deploy this architecture, you will need:

1. An AWS Account and AWS CLI configured via aws configure sso.
2. Docker installed locally for image building.
3. A GitHub account to fork the repository.
4. Basic familiarity with SSH and Linux command-line tools.

## ```📖 Deployment Guide```
**1. Build and Prepare the Docker Image**

   First, clone the repository and build the container image.

      PowerShell
        
      git clone https://github.com/your-github-username/AWS_grocery.git
      cd AWS_grocery/backend
      docker build -t grocerymate

**2. Infrastructure Provisioning**
   
   Before running the application, provision the required AWS resources:
   - Amazon S3: Create a private S3 bucket (e.g., grocerymate-avatars) and create an avatars/ folder inside it.
   - Amazon RDS: Provision a PostgreSQL 15 RDS instance in a private subnet.
   - IAM Role: Create an IAM Role with S3 write permissions and attach it to your EC2 instance.

**3. Database Migration**
   
   Connect to your new RDS instance from your EC2 machine to create the schema and populate the initial data.

        PowerShell

        psql -h <your-rds-endpoint> -U postgres -c "CREATE DATABASE grocerymate_db;"
        psql -h <your-rds-endpoint> -U postgres -c "CREATE USER grocery_user WITH ENCRYPTED PASSWORD 'your_password';"
        psql -h <your-rds-endpoint> -U grocery_user -d grocerymate_db -f backend/app/sqlite_dump_clean.sql

**4. Run the Containerized Application**
   
   With the infrastructure in place, run the Docker container on your EC2 instance. This command injects the necessary environment variables to connect to RDS and utilize S3 for storage.

        PowerShell

        docker run -d --network host \
          --name grocerymate \
          -e S3_BUCKET_NAME=grocerymate-avatars \
          -e S3_REGION=eu-central-1 \
          -e USE_S3_STORAGE=true \
          -e POSTGRES_USER=grocery_user \
          -e POSTGRES_PASSWORD=your_password \
          -e POSTGRES_DB=grocerymate_db \
          -e POSTGRES_HOST=<your-rds-endpoint> \
          -e POSTGRES_URI=postgresql://grocery_user:your_password@<your-rds-endpoint>:5432/grocerymate_db \
          grocerymate

**5. Verify the Deployment**

   Navigate to your EC2 Public IP (or ELB DNS name) on port 5000:

        Plaintext
   
        http://<EC2-PUBLIC-IP>:5000

   Create a new user and upload an avatar to verify that the PostgreSQL integration and S3 storage routing are functioning correctly.

**6. Provision Infrastructure**

Navigate to the terraform directory and initialize the environment:

         Powershell
      
         cd terraform
         terraform init
         terraform apply -var="db_username=your_user" -var="db_password=your_password"

## ```🔮 Next Steps: Scaling & Automation Roadmap```

If you want to take this project to the next level, here is the exact roadmap to transition this architecture from a manual configuration into a fully automated, scalable, production-ready environment.

**Step 1: Infrastructure as Code (Terraform Migration)**

Currently, the AWS resources (VPC, EC2, RDS, S3, ELB) were created manually via the console or CLI. The next goal is to codify this infrastructure so it can be spun up or destroyed with a single command.

**Action Items:**
1. Install Terraform on your local machine.
2. Structure your files: Create a main.tf (for resources), variables.tf (for dynamic inputs like region or instance size), and outputs.tf (to output the ELB DNS name).
3. Write the AWS Provider block and configure it to use your AWS SSO credentials.
4. Codify the network: Write Terraform blocks for your VPC, Subnets, Internet Gateway, and Route Tables.
5. Codify compute and data: Write the configuration for the Security Groups, EC2 instances, RDS Database, and S3 bucket.
6. Deploy: Run terraform init, terraform plan, and terraform apply.

**Procedure for Step 1:**

A comprehensive starter template to get your infrastructure codified. To keep things organized and adhere to Terraform best practices, I have broken this down into three standard files:
1. variables.tf,
2. main.tf,
3. outputs.tf.

Create a new directory for your project, add these files, and you'll be ready to initialize.

**1. variables.tf**

This file defines the inputs for your infrastructure, making it easy to change regions, instance sizes, or database credentials without digging through the main code.

        Terraform

        variable "aws_region" {
          description = "The AWS region to deploy into"
          default     = "us-east-1"
        }
        
        variable "project_name" {
          description = "The name of the project"
          default     = "docker-app-deployment"
        }
        
        variable "instance_type" {
          description = "EC2 instance type"
          default     = "t2.micro"
        }
        
        variable "db_username" {
          description = "Database administrator username"
          type        = string
          sensitive   = true
        }
        
        variable "db_password" {
          description = "Database administrator password"
          type        = string
          sensitive   = true
        }

**2. main.tf**

This is the core file where your infrastructure is defined. Note: For a true production environment, you would expand the networking block to span multiple Availability Zones (AZs) for high availability, but this provides the foundational structure.

        Terraform
        
        terraform {
          required_providers {
            aws = {
              source  = "hashicorp/aws"
              version = "~> 5.0"
            }
          }
        }
        
        provider "aws" {
          region = var.aws_region
        }

**NETWORKING (VPC, Subnets, Internet Gateway)**

        resource "aws_vpc" "main" {
          cidr_block           = "10.0.0.0/16"
          enable_dns_hostnames = true
          enable_dns_support   = true
        
          tags = {
            Name = "${var.project_name}-vpc"
          }
        }
        
        resource "aws_internet_gateway" "igw" {
          vpc_id = aws_vpc.main.id
        }
        
        resource "aws_subnet" "public_subnet" {
          vpc_id                  = aws_vpc.main.id
          cidr_block              = "10.0.1.0/24"
          map_public_ip_on_launch = true
          availability_zone       = "${var.aws_region}a"
        }
        
        resource "aws_subnet" "private_subnet" {
          vpc_id            = aws_vpc.main.id
          cidr_block        = "10.0.2.0/24"
          availability_zone = "${var.aws_region}b"
        }

**SECURITY GROUPS**

        resource "aws_security_group" "alb_sg" {
          name        = "${var.project_name}-alb-sg"
          description = "Allow HTTP inbound traffic"
          vpc_id      = aws_vpc.main.id
        
          ingress {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
          }
        
          egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
          }
        }
        
        resource "aws_security_group" "ec2_sg" {
          name        = "${var.project_name}-ec2-sg"
          description = "Allow traffic from ALB"
          vpc_id      = aws_vpc.main.id
        
          ingress {
            from_port       = 8000
            to_port         = 8000
            protocol        = "tcp"
            security_groups = [aws_security_group.alb_sg.id]
          }
        
          egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
          }
        }

**COMPUTE (EC2)**

Fetch the latest Amazon Linux 2 AMI

        data "aws_ami" "amazon_linux_2" {
          most_recent = true
          owners      = ["amazon"]
        
          filter {
            name   = "name"
            values = ["amzn2-ami-hvm-*-x86_64-gp2"]
          }
        }

        resource "aws_instance" "app_server" {
          ami           = data.aws_ami.amazon_linux_2.id
          instance_type = var.instance_type
          subnet_id     = aws_subnet.public_subnet.id
          
          vpc_security_group_ids = [aws_security_group.ec2_sg.id]

User data script to install Docker and run the application automatically

          user_data = <<-EOF
                      #!/bin/bash
                      sudo yum update -y
                      sudo amazon-linux-extras install docker -y
                      sudo service docker start
                      sudo usermod -a -G docker ec2-user
                      # sudo docker run -d -p 8000:8000 my-app-image:latest
                      EOF
        
          tags = {
            Name = "${var.project_name}-ec2"
          }
        }

**STORAGE (S3)**

        resource "aws_s3_bucket" "app_storage" {
          bucket = "${var.project_name}-storage-bucket-${random_id.bucket_id.hex}"
        }
        
        resource "random_id" "bucket_id" {
          byte_length = 4
        }

**DATABASE (RDS PostgreSQL)**

        resource "aws_db_subnet_group" "db_subnet" {
          name       = "${var.project_name}-db-subnet-group"
          # Note: RDS requires at least 2 subnets in different AZs for a subnet group
          subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id] 
        }
        
        resource "aws_db_instance" "postgres_db" {
          allocated_storage      = 20
          engine                 = "postgres"
          engine_version         = "14"
          instance_class         = "db.t3.micro"
          db_name                = "appdb"
          username               = var.db_username
          password               = var.db_password
          db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
          skip_final_snapshot    = true
          publicly_accessible    = false
        }

**3. outputs.tf**

This file prints out the important information you need after the deployment finishes, so you don't have to hunt through the AWS console to find your endpoints.

        Terraform
        
        output "ec2_public_ip" {
          description = "The public IP of the EC2 instance"
          value       = aws_instance.app_server.public_ip
        }
        
        output "rds_endpoint" {
          description = "The connection endpoint for the RDS database"
          value       = aws_db_instance.postgres_db.endpoint
        }
        
        output "s3_bucket_name" {
          description = "The name of the generated S3 bucket"
          value       = aws_s3_bucket.app_storage.bucket
        }

**How to use this:**
1. Ensure your AWS CLI is authenticated via SSO (aws sso login).
2. Initialize Terraform to download the AWS provider:

        PowerShell
        terraform init

3. Check what Terraform is going to build. It will prompt you for your sensitive database username and password:

        PowerShell
        terraform plan

4. Deploy the infrastructure:

        PowerShell
        terraform apply

**Step 2: Implement a CI/CD Pipeline (GitHub Actions)**

Right now, updating the application requires manually SSH-ing into the EC2 instance, pulling the new code, rebuilding the Docker image, and restarting the container. Let's automate that.

**Action Items:**
1. Set up GitHub Secrets: Store your AWS credentials (or set up OIDC) securely in your GitHub repository settings.
2. Create a Workflow File: In your repository, create .github/workflows/deploy.yml.
3. Automate the Build: Configure the workflow to trigger on a git push to the main branch. Have it check out the code and build the Docker image.
4. Push to a Registry: Add a step to push the built Docker image to Amazon ECR (Elastic Container Registry) or Docker Hub.
5. Automate the Deployment: Use AWS Systems Manager (SSM) Run Command within the pipeline to tell your EC2 instances to pull the latest image and restart the container automatically.

**Step 3: Implement Auto-Scaling & High Availability**

An Elastic Load Balancer (ELB) is great, but if your traffic spikes, you need your EC2 instances to multiply automatically.

**Action Items:**
1. Create an AMI: Take your fully configured EC2 instance (with Docker installed and running) and create an Amazon Machine Image (AMI) from it.
2. Create a Launch Template: Use that AMI to define a Launch Template, specifying the instance type, security groups, and an IAM role.
3. Configure the Auto Scaling Group (ASG): Attach the ASG to your existing Target Group and ELB. Set a minimum capacity of 2 instances and a maximum of 5.
4. Set Scaling Policies: Create a step scaling policy based on CPU utilization (e.g., "If average CPU > 70% for 3 minutes, add 1 instance").

**Step 4: Monitoring and Observability**

To maintain a production environment, you need to know what is happening inside it.

**Action Items:**
1. CloudWatch Metrics: Set up Amazon CloudWatch dashboards to monitor your EC2 CPU usage, RDS database connections, and ELB request counts.
2. Billing Alarms: Set up an AWS Budgets alarm to notify you via email if your infrastructure costs exceed a certain threshold ($5-$10/month).
3. Centralized Logging: Configure your Docker containers to send their application logs to CloudWatch Logs so you don't have to SSH into instances to troubleshoot errors.
