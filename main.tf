module "vpc" {
  source = "./modules/vpc"

  project             = var.project
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  azs                 = var.azs
}

module "security_group" {
  source = "./modules/security_group"

  project  = var.project
  vpc_id   = module.vpc.vpc_id
  ssh_cidr = var.ssh_cidr
}

module "ec2" {
  source = "./modules/ec2"

  project               = var.project
  subnet_id             = module.vpc.public_subnet_ids[0]
  security_group_id     = module.security_group.security_group_id
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  instance_profile_name = module.iam.instance_profile_name
}

module "s3" {
  source      = "./modules/s3"
  project     = var.project
  bucket_name = "${var.bucket_name_prefix}-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}

module "iam" {
  source  = "./modules/iam"
  project = var.project
}

module "cloudwatch" {
  source      = "./modules/cloudwatch"
  project     = var.project
  instance_id = module.ec2.instance_id
}
