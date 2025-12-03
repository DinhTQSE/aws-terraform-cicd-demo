resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-app-bucket-cicd-demo-45688888" # Tên phải là duy nhất toàn cầu

  tags = {
    Name        = "DemoBucket"
    Environment = "Dev"
  }
}
# --- Phần mới thêm vào (EC2) ---

# 1. Tìm AMI Amazon Linux 2 mới nhất
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# 2. Tạo EC2 Instance
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro" # Loại nhỏ nhất (Free Tier)

  tags = {
    Name = "Server-Created-By-CICD"
  }
}