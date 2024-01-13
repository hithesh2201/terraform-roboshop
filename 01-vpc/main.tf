module "vpc" {
    source = "../../terraform-vpc"
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
    database_subnets = var.database_subnets
    availability_zones = local.availability_zones
  
}