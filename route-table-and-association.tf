
##################ROUTE-TABLE###############
resource "aws_route_table" "Pager-public" {
  vpc_id = aws_vpc.pager-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Pagerinternet-gw.id
  }
  tags = {
    Name = "PagerPublicRoute"
  }
}

resource "aws_route_table_association" "Pager-public-subnet" {
  subnet_id      = aws_subnet.public-subnet-Pager.id
  route_table_id = aws_route_table.Pager-public.id
}
