# main.tf

terraform {

    cloud {
      organization = "Skill_upgrade"
      workspaces {
      name = "learn-tfc-aws"
    }
    }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

data "aws_ami" "app_ami"{
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["amzn2-ami-hvm*"]

    }

}

variable "list" {
    type = list
    default = ["m5.large","t2.medium","t2.small"]
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.list[1]

  tags = {
    Name = var.instance_name
  }
}

# variables.tf

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

output "instance_public_ip" {
    description = "Public IP of the instance"
    value = aws_instance.app_server.public_ip
  
}
