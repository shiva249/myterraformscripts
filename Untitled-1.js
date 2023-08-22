provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "varin" {
    ami = "ami-026ebd4cfe2c043b2"
    instance_type = "var.instance_type"
    tags = {
        Name = "Launched using vars"
    }
}

variable "instance_type" {
    description = "Instance type t2.micro"
    type = string
    default = "t2.micro"
}