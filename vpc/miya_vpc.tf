# VPC
resource "aws_vpc" "miya_apnorth_vpc01" {
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  region                               = "ap-northeast-1"
  tags = {
    Name = "miya_apnorth_vpc01"
  }
}

