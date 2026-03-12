#AWS Terraform Foundation
![Infrastructure as Code](https://img.shields.io/badge/IaC-Terraform-5C4EE5?logo=terraform)
![Cloud Provider](https://img.shields.io/badge/Cloud-AWS-FF9900?logo=amazon-aws)
![Region](https://img.shields.io/badge/Region-eu--west--1-blue)
![Status](https://img.shields.io/badge/Build-Ready-brightgreen)

##🚀 What This Project Builds
This Terraform project provisions a complete AWS foundational environment including networking, compute, storage, IAM, and monitoring. It follows modular best practices and demonstrates how to build secure, production‑ready infrastructure using Infrastructure as Code.

The stack includes:

VPC + public subnets
Security group with restricted SSH
EC2 instance
S3 bucket with encryption + blocked public access
IAM role + instance profile for EC2
CloudWatch CPU alarm

##🏗️ Architecture Diagram
```
                         +-----------------------------+
                         |         AWS Region          |
                         |        (eu-west-1)          |
                         +-----------------------------+
                                      |
                                      |
                         +-----------------------------+
                         |             VPC             |
                         |        10.0.0.0/16          |
                         +-----------------------------+
                           |                       |
                           |                       |
                +----------------+       +----------------+
                | Public Subnet 1|       | Public Subnet 2|
                | 10.0.1.0/24    |       | 10.0.2.0/24    |
                +----------------+       +----------------+
                          |                       |
                          |                       |
                 +----------------+               |
                 |   EC2 Instance |               |
            |----|  IAM Role + SG |               |
            |    +----------------+               |
            |             |                       |
            |             |                       |
            |    +----------------------------------------+
            |    |                S3 Bucket               |
            |    |  Versioning + Encryption + No Public   |
            |    +----------------------------------------+
            |
            |                          
+-----------------------------+
| CloudWatch CPU Alarm (>80%) |
+-----------------------------+
```
##📦 Prerequisites
Before deploying, ensure you have:

AWS CLI installed and configured

```
aws configure
Terraform v1.x installed
```

An AWS IAM user or role with permissions to create VPC, EC2, S3, IAM, CloudWatch

##🚀 How to Deploy
From the project root:

```
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```
To destroy the environment:

```
terraform destroy
```
##🔐 Security Decisions (Important for Reviewers)
1. SSH restricted to a single IP
Only your home IP is allowed to SSH into the EC2 instance.
This prevents brute‑force attacks and is a core AWS security best practice.

2. S3 bucket is fully private
Block public access enabled
Server‑side encryption (AES256)
No public ACLs or policies
This prevents accidental data exposure.

3. IAM role instead of access keys
The EC2 instance uses an instance profile with the AmazonS3ReadOnlyAccess policy.
This avoids hardcoded credentials and follows AWS’s recommended approach for workload identity.

4. Least privilege everywhere
Every resource is created with the minimum required permissions.

##📤 Outputs Provided
After deployment, Terraform prints:

EC2 public IP
S3 bucket name
VPC ID
EC2 instance ID

These are useful for testing, SSH access, and integration.

##🧭 What I’d Add Next (Future Enhancements)

Remote Terraform state in S3 + DynamoDB locking
Private subnets + NAT Gateway
Load Balancer + Auto Scaling Group
HTTPS with ACM + ALB
CloudWatch Logs + Unified Agent
SNS notifications for CloudWatch alarms
CI/CD pipeline (GitHub Actions) for fmt/validate/plan
KMS encryption for S3 and IAM policies enforcing it

![Made with Love](https://img.shields.io/badge/Made%20with%20%E2%9D%A4%20by-Deepak-blueviolet)
![Learning Project](https://img.shields.io/badge/Project-Type%3A%20Learning-ff69b4)

🎉