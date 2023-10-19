/*
provider "aws" {
  region = "us-east-1"
  }

resource "aws_instance" "test" {
  ami = "ami-067d1e60475437da2"
  instance_type = var.list[1]
  count = 4

tags = {
    Name = var.instance_name[count.index]
}
}
*/