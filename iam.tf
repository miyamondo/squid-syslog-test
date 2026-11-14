# EC2へ紐づけるロール自体の作成と信頼ポリシーの指定
resource "aws_iam_role" "miya_ec2iamrole" {
  name = "miya_ec2iamrole"
  assume_role_policy = file("./miyaec2role.json")
}

# SSMでEC2に接続し実行した操作がCloudWatchLogsへ出力されるようにするためのIAMポリシー
resource "aws_iam_policy" "miya_ssm_cwl_policy" {
  name   = "miya_ssm_cwl_policy"
  policy = file("./miya_ssmcwlog_policy.json")
}

resource "aws_iam_role_policy_attachment" "miya_ssm_core" {
  role       = aws_iam_role.miya_ec2iamrole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "miya_ssm_attach" {
  role       = aws_iam_role.miya_ec2iamrole.name
  policy_arn = aws_iam_policy.miya_ssm_cwl_policy.arn
}

resource "aws_iam_instance_profile" "miya_ec2_instance_profile" {
  name = "miya_ec2_instance_profile"
  role = aws_iam_role.miya_ec2iamrole.name
}