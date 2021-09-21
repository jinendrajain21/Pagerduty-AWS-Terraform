########################SUBNET#########
resource "aws_subnet" "public-subnet-Pager" {
  vpc_id                  = aws_vpc.pager-vpc.id
  cidr_block              = "10.30.1.0/24"
  map_public_ip_on_launch = "true"
  #availability_zone       = "eu-west-1a"

  tags = {
    Name = "Public-Subnet-Pager"
  }
}
