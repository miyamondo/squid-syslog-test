# Association route

resource "aws_route_table_association" "miya_public-association" {
  subnet_id      = aws_subnet.miya_public_a.id
  route_table_id = aws_route_table.miya_public-route.id
}

resource "aws_route_table_association" "miya_private-association" {
  subnet_id      = aws_subnet.miya_private_a.id
  route_table_id = aws_route_table.miya_private-route.id
}
