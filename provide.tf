terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Cấu hình Backend (Kết nối với những gì bạn vừa tạo)
  backend "s3" {
    bucket         = "terraform-state-khoa-project-2025" # Tên Bucket bạn tạo ở Phần 1
    key            = "dev/terraform.tfstate"             # Đường dẫn file state trong bucket (tự đặt)
    region         = "ap-southeast-1"                    # Vùng của Bucket
    encrypt        = true                                # Mã hóa dữ liệu
    dynamodb_table = "terraform-lock-table"              # Tên Table bạn tạo ở Phần 2
  }
}

provider "aws" {
  region = "ap-southeast-1"
}