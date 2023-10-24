provider "aws" {
  region = "us-east-1"
  }
  
  variable "region"{
    default = "ap-south-1"
  }

  variable "names" {
    type = list
    default = ["dev1","prod2"]
    
  }

  variable "ami"{
    type = map
    default = {
         "us-east-1" = "ami-0323c3dd2da7fb37d"
         "us-west-2" = "ami-0d6621c01e8c2de2c"
         "ap-south-1" = "ami-0470e33cd681b2476"
    }
  }
resource "aws_key_pair" "loginkey" {
    key_name = "loginkey"
    public_key = "file(${path.module}/id_ras.txt)" 
}

  resource "aws_instance" "dev" {
  ami = lookup(var.ami,var.region)
  instance_type = "t2.micro"
  key_name = aws_key_pair.loginkey.key_name
  count = 2

  tags = {
    Name = element(var.names,count.index)
  }
  }

locals {
  time = formatdate("DD MMM YYY hh:mm ZZZ", timestamp() )
}
  output "timestamp" {
    value = local.time
    
  }