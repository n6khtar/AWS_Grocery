# --- NETWORKING & ROUTE TABLES ---
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = { Name = "${var.project_name}-vpc" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Public Subnet (For EC2)
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = true
}

# Two Private Subnets (Required for RDS High Availability)
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = "${var.aws_region}a"
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = "${var.aws_region}b"
}

# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# --- SECURITY GROUPS ---

# EC2 Security Group
resource "aws_security_group" "ec2_sg" {
  name   = "ec2-web-sg"
  vpc_id = aws_vpc.main.id
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

# RDS Security Group (Only allows traffic from EC2)
resource "aws_security_group" "rds_sg" {
  name   = "rds-private-sg"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id] # Logic: Only EC2 can talk to DB
  }
}

# --- IAM ROLE (The "Missing Logic" for S3 Access) ---
resource "aws_iam_role" "ec2_role" {
  name = "grocerymate-ec2-s3-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}

resource "aws_iam_role_policy_attachment" "s3_full" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "grocerymate-instance-profile"
  role = aws_iam_role.ec2_role.name
}

# --- COMPUTE ---
resource "aws_instance" "app_server" {
  ami                    = "ami-0440d3b780d96b29d" # Amazon Linux 2 (Verify for your region)
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name # Attach IAM Logic

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              EOF
}

# --- DATABASE (Strictly Private) ---
resource "aws_db_subnet_group" "db_subnets" {
  name       = "main-db-subnets"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id] # Private only!
}

resource "aws_db_instance" "postgres" {
  identifier           = "grocerymate-db"
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"
  db_name              = "grocerymate_db"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.db_subnets.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id] # Attach RDS SG
  skip_final_snapshot  = true
  publicly_accessible  = false
}

# --- STORAGE ---
resource "aws_s3_bucket" "avatars" {
  bucket        = "grocerymate-avatars-${random_id.id.hex}"
  force_destroy = true # Good for MVP/Testing
}

resource "random_id" "id" { byte_length = 4 }
