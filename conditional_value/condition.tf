/*
provider "aws" {
  region = "us-east-1"
  }

resource "aws_instance" "dev" {
  ami = "ami-067d1e60475437da2"
  instance_type = var.list[2]
  count = var.istest == true ? 5 : 0
}

  resource "aws_instance" "prod" {
  ami = "ami-067d1e60475437da2"
  instance_type = var.list[1]
  count = var.istest == false ? 1 : 0
}
*/
