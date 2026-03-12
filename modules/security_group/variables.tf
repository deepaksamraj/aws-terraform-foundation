variable "project" {
  description = "Project name prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH into EC2"
  type        = string
}
