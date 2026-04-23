variable "aws_region" {
  description = "The AWS region to deploy into"
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project"
  default     = "grocerymate-aws"
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