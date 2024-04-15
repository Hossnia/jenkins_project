resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.jenkins-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gateway.id
  }
}

resource "aws_route_table_association" "ps1" {
  subnet_id = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "ps2" {
  subnet_id = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route.id
}