data "aws_vpc" "target_vpc" {
  filter {
    name   = "tag:Name"
    values = ["miya_apnorth_vpc01"]
  }
}

data "aws_subnet" "target_public_a" {
  filter {
    name   = "tag:Name"
    values = ["miya_public_a"]
  }
}

data "aws_subnet" "target_private_a" {
  filter {
    name   = "tag:Name"
    values = ["miya_private_a"]
  }
}