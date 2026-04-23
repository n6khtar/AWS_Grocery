variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "grocerymate"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_1_cidr" {
  default = "10.0.2.0/24"
}

variable "private_subnet_2_cidr" {
  default = "10.0.3.0/24"
}

variable "db_username" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}
