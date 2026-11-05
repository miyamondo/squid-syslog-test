# Routetable
resource "aws_route_table" "miya_public-route" {
  vpc_id = aws_vpc.miya_apnorth_vpc01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.miya_vpc_igw.id
  }

  tags = {
    Name = "miya_public-route"
  }
}

resource "aws_route_table" "miya_private-route" {
  vpc_id = aws_vpc.miya_apnorth_vpc01.id

  tags = {
    Name = "miya_private-route"
  }
}