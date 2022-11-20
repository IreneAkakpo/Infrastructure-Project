# Creating a VPC
resource "aws_vpc" "Project-VPC" {
  cidr_block           = var.cidr-for-vpc
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    Name = var.environment_name
  }
}