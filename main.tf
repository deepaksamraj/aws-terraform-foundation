module "security_group" {
  source = "./modules/security_group"

  project  = "foundation"
  vpc_id   = module.vpc.vpc_id
  ssh_cidr = "51.199.236.13/32"
}

module "vpc" {
  source = "./modules/vpc"

  project = "foundation"

  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  azs = [
    "eu-west-1a",
    "eu-west-1b"
  ]
}
module "ec2" {
  source = "./modules/ec2"

  project           = "foundation"
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.security_group.security_group_id
  ami_id            = "ami-09d0c9a85bf1b9ea7" # Ubuntu 22.04 LTS AMI for eu-west-1
  instance_profile_name = module.iam.instance_profile_name
}

module "s3" {
  source      = "./modules/s3"
  
  project     = "foundation"
  bucket_name = "deepak-demo-bucket-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}
module "iam" {
  source  = "./modules/iam"
  project = "foundation"
}
module "cloudwatch" {
  source      = "./modules/cloudwatch"
  project     = "foundation"
  instance_id = module.ec2.instance_id
}
