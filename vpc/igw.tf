# Internet Gateway
resource "aws_internet_gateway" "miya_vpc_igw" {
  vpc_id = aws_vpc.miya_apnorth_vpc01.id
  tags = {
   Name = "miya_vpc_igw"
  }
}