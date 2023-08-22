provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "terr-first" {
    ami = "ami-026ebd4cfe2c043b2"
    instance_type = "t2.micro"
    key_name = "AWS"
    tags = {
        Name = "terra-practise-1"
    }
}