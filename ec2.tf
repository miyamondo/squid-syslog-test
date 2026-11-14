
resource "aws_eip" "miya_squid_ip" {
  instance = aws_instance.miya_squid.id
  tags = {
    Name = "miya_squid_ip"
  }
}


resource "aws_instance" "miya_squid" {
  ami                    = var.miya_ami_id
  instance_type          = var.miya_instance_type
  subnet_id              = data.aws_subnet.target_public_a.id
  iam_instance_profile   = aws_iam_instance_profile.miya_ec2_instance_profile.name
  vpc_security_group_ids = [aws_security_group.miya_squid_sg.id]
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  ebs_block_device{
    device_name = "/dev/sdb"
    volume_size = 5
    volume_type = "gp3"
    delete_on_termination = true
  }
  ebs_block_device{
    device_name = "/dev/sdc"
    volume_size = 5
    volume_type = "gp3"
    delete_on_termination = true
  }  
  tags = {
    Name = "miya_squid"
  }
}

resource "aws_instance" "miya_syslog" {
  ami                    = var.miya_ami_id
  instance_type          = var.miya_instance_type
  subnet_id              = data.aws_subnet.target_private_a.id
  iam_instance_profile   = aws_iam_instance_profile.miya_ec2_instance_profile.name
  vpc_security_group_ids = [aws_security_group.miya_syslog_sg.id]

  tags = {
    Name = "miya_syslog"
  }
}