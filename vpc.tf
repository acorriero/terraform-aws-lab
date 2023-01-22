module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs = [var.zone1, var.zone2, var.zone3]
  public_subnets = [var.pubsub1cidr, var.pubsub2cidr, var.privsub3cidr]
  private_subnets = [var.privsub1cidr, var.privsub2cidr, var.privsub3cidr]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support = true
  
  tags = {
    Terraform = "true"
    Environment = "test"
  }

  vpc_tags = {
    Name = var.vpc_name
  }
}

