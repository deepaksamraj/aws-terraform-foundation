variable "project" {
  description = "Project name prefix"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to attach to EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID to use for EC2"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile to attach to EC2"
  type        = string
}
