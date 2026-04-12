# ==========================================
# 1. PROVIDER SETUP
# Tells Terraform to use AWS and which region
# ==========================================
provider "aws" {
  region = "us-east-1"
}

# ==========================================
# 2. SECURITY GROUPS (The Firewalls)
# ==========================================

# Security Group for EC2: Allows you to SSH in, and allows web traffic
resource "aws_security_group" "ec2_sg" {
  name        = "grocery_app_ec2_sg"
  description = "Allow HTTP and SSH inbound traffic"

  # Allow HTTP (Port 80) from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH (Port 22) from anywhere (Note: In production, limit this to your IP!)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic (so the server can download updates/packages)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for RDS: ONLY allows traffic coming FROM the EC2 instance
resource "aws_security_group" "rds_sg" {
  name        = "grocery_app_rds_sg"
  description = "Allow PostgreSQL traffic from EC2 only"

  ingress {
    from_port       = 5432 # Default PostgreSQL port
    to_port         = 5432
    protocol        = "tcp"
    # This is the magic line: it links the database firewall to the EC2 firewall
    security_groups = [aws_security_group.ec2_sg.id]
  }
}

# ==========================================
# 3. DATA BLOCK: GET LATEST AMI
# Automatically finds the newest Amazon Linux image so you don't have to hardcode it
# ==========================================
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# ==========================================
# 4. EC2 INSTANCE (The App Server)
# ==========================================
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro" # Free-tier eligible

  # Attach the EC2 Security Group we created above
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  # If you have an SSH key in AWS, put the name here (e.g., "grocerymate-key")
  key_name = "tf-key"

  tags = {
    Name = "GroceryAppServer"
  }
}

# ==========================================
# 5. RDS INSTANCE (The Database)
# ==========================================
resource "aws_db_instance" "postgres_db" {
  identifier             = "grocery-db"
  engine                 = "postgres"
  engine_version         = "16.3"
  instance_class         = "db.t3.micro" # Free-tier eligible
  allocated_storage      = 20            # 20 GB is the free tier limit

  db_name                = "grocerydb"
  username               = "dbadmin"
  password               = "SuperSecretPassword123!" # Change this!

  # Attach the RDS Security Group
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  # Required for learning/dev so Terraform can easily delete it later without errors
  skip_final_snapshot    = true
  publicly_accessible    = false # Keeps the DB private to the AWS network
}

# ==========================================
# 6. OUTPUTS (Connection Details)
# ==========================================
output "ec2_public_ip" {
  description = "The public IP address of the web server"
  value       = aws_instance.app_server.public_ip
}

output "rds_endpoint" {
  description = "The connection endpoint for the PostgreSQL database"
  value       = aws_db_instance.postgres_db.endpoint
}