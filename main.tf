resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-app-bucket-cicd-demo-45688888" # Tên phải là duy nhất toàn cầu

  tags = {
    Name        = "DemoBucket"
    Environment = "Dev"
  }
}