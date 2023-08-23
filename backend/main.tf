terraform {
  backend "s3" {
    bucket = "bucketname"
    key = "folder/terraform.tfstate"  #folder is directory
    region = "us-east-1"
  }
}
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "workinstance" {
    ami = "ami-054965c6cd7c6e462"
    instance_type = var.instance_type
}