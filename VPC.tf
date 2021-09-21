resource "aws_vpc" "pager-vpc" {
  cidr_block       = "10.30.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Pager-VPC"
  }
}
