variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "foundation"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "ssh_cidr" {
  description = "Allowed SSH CIDR"
  type        = string
  default     = "51.199.236.13/32"
}

variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
  default     = "ami-09d0c9a85bf1b9ea7"
}

variable "bucket_name_prefix" {
  description = "Prefix for S3 bucket name"
  type        = string
  default     = "deepak-demo-bucket"
}
