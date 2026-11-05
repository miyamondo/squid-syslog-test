# Subnet
## public
resource "aws_subnet" "miya_public_a" {
  vpc_id = aws_vpc.miya_apnorth_vpc01.id
  availability_zone                              = "ap-northeast-1a"
  cidr_block                                     = "10.0.1.0/24"
  tags = {
    Name = "miya_public_a"
  }
}

## private
resource "aws_subnet" "miya_private_a" {
  vpc_id = aws_vpc.miya_apnorth_vpc01.id
  availability_zone                              = "ap-northeast-1a"
  cidr_block                                     = "10.0.2.0/24"
  tags = {
    Name = "miya_private_a"
  }
}