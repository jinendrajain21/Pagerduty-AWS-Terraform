############################Internet-Gateway#################
resource "aws_internet_gateway" "Pagerinternet-gw" {
  vpc_id = aws_vpc.pager-vpc.id

  tags = {
    Name = "PagerInternet-GW"
  }
}
