provider "aws" {
  region = "us-east-1"
  }

  locals{
    common_tags ={
        Owner = "Ange"
        Environtment = "Non-Prod"
    }
  }

resource "aws_instance" "test" {
  ami = "ami-067d1e60475437da2"
  instance_type = "t2.micro"
  tags = local.common_tags
}

resource "aws_instance" "test1" {
  ami = "ami-067d1e60475437da2"
  instance_type = "t2.micro"
  tags = local.common_tags
}

locals{
    uncommon_tags = "djamzn"
    }

resource "aws_instance" "test2" {
  ami = "ami-067d1e60475437da2"
  instance_type = "t2.micro"
  tags = {
    Name = "${local.uncommon_tags}-vpc"
}
}

resource "aws_instance" "test3" {
  ami = "ami-067d1e60475437da2"
  instance_type = "t2.micro"
  tags = {
    Name = "${local.uncommon_tags}-elb"
}
}
