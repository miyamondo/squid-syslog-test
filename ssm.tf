resource "aws_ssm_document" "session_manager_prefs" {
  name            = "SSM-SessionManagerRunShell"
  document_type   = "Session"
  document_format = "JSON"

  content = jsonencode({
    schemaVersion = "1.0"
    description   = "Session Manager Preferences"
    sessionType   = "Standard_Stream"
    inputs = {
      s3BucketName                = ""
      s3KeyPrefix                 = ""
      s3EncryptionEnabled         = false
      cloudWatchLogGroupName      = aws_cloudwatch_log_group.miya_ssm_logs.name
      cloudWatchEncryptionEnabled = false
      cloudWatchStreamingEnabled  = true
      kmsKeyId                    = ""
      runAsEnabled                = false
      runAsDefaultUser            = ""
      
      # --- 以下、AWSの既存デフォルト設定を維持するための追記 ---
      idleSessionTimeout          = "20"
      maxSessionDuration          = ""
      shellProfile = {
        linux   = ""
        windows = ""
      }
    }
  })
}