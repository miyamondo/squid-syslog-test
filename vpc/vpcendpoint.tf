resource "aws_vpc_endpoint" "miya_end_ec2msg" {
  vpc_id       = aws_vpc.miya_apnorth_vpc01.id
  service_name = "com.amazonaws.ap-northeast-1.ec2messages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids = [
    aws_subnet.miya_private_a.id,
  ]

  security_group_ids = [
    aws_security_group.miya_end_sg.id,
  ]

  tags = {
    Name = "miya_end_ec2msg"
  }
}

resource "aws_vpc_endpoint" "miya_end_ssm" {
  vpc_id       = aws_vpc.miya_apnorth_vpc01.id
  service_name = "com.amazonaws.ap-northeast-1.ssm"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids = [
    aws_subnet.miya_private_a.id,
  ]

  security_group_ids = [
    aws_security_group.miya_end_sg.id,
  ]

  tags = {
    Name = "miya_end_ssm"
  }
}

resource "aws_vpc_endpoint" "miya_end_ssmmsg" {
  vpc_id       = aws_vpc.miya_apnorth_vpc01.id
  service_name = "com.amazonaws.ap-northeast-1.ssmmessages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids = [
    aws_subnet.miya_private_a.id,
  ]
  
  security_group_ids = [
    aws_security_group.miya_end_sg.id,
  ]
  
  tags = {
    Name = "miya_end_ssmmsg"
  }
}

resource "aws_vpc_endpoint" "miya_end_logs" {
  vpc_id              = aws_vpc.miya_apnorth_vpc01.id
  service_name        = "com.amazonaws.ap-northeast-1.logs"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids = [
    aws_subnet.miya_private_a.id,
  ]

  security_group_ids = [
    aws_security_group.miya_end_sg.id,
  ]

  tags = {
    Name = "miya_end_logs"
  }
}