terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "xxxxx"
}

module "network" {
  source = "./modules/network"
  azs    = ["us-east-1a", "us-east-1b"]
}

module "ec2" {
  source               = "./modules/ec2"
  subnet_id            = module.network.public_subnet_ids[1]
  redhat_ami           = var.redhat_ami
  iam_instance_profile = module.iam.ec2_logs_instance_profile
}

module "asg" {
  source               = "./modules/asg"
  private_subnet_ids   = module.network.private_subnet_ids
  redhat_ami           = var.redhat_ami
  iam_instance_profile = module.iam.asg_images_instance_profile
}

module "alb" {
  source             = "./modules/alb"
  public_subnet_ids  = module.network.public_subnet_ids
  vpc_id             = module.network.vpc_id
}

module "s3" {
  source = "./modules/s3"
}

module "iam" {
  source = "./modules/iam"
}

