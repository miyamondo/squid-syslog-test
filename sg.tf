resource "aws_security_group" "miya_squid_sg" {
  name   = "miya_squid_sg"
  vpc_id = data.aws_vpc.target_vpc.id
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
  }
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
  }
  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "miya_squid_sg"
  }
}

resource "aws_security_group" "miya_syslog_sg" {
  name   = "miya_syslog_sg"
  vpc_id = data.aws_vpc.target_vpc.id

  ingress {
    from_port       = 514
    to_port         = 514
    protocol        = "tcp"
    cidr_blocks = [data.aws_subnet.target_public_a.cidr_block]
  }
  ingress {
    from_port       = 514
    to_port         = 514
    protocol        = "udp"
    cidr_blocks = [data.aws_subnet.target_public_a.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "miya_syslog_sg"
  }
}