terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0912f71e06545ad88"
  instance_type = "t2.micro"
  key_name = "hydrus"


  tags = {
    Name = "Hydrus Development VM"
  }
}

resource "aws_security_group" "sg-http" {
  name        = "security_group_terraform"
  description = "security_group_terraform"
  vpc_id      = "vpc-aef92ec5"

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg-http"
  }
}

