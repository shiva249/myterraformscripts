provider "aws" {
    region = "us-east-1"
}
locals {
    staging_env = "stage"
}

resource "aws_vpc" "vpcsection" {
    cidr_block = "10.5.0.0/16"
    tags = {
        name = "${local.staging_env}-vpc-tag"
    }
}

resource "aws_subnet" "subnetsection" {
    vpc_id = aws_vpc.vpcsection.id
    cidr_block = "10.5.0.0/16"
    tags = {
        name= "${local.staging_env}-subnet-tag"
    }
}

resource "aws_instance" "localuse" {
    ami = "ami-054965c6cd7c6e462"
    instance_type = var.instance_type
    subnet_id = aws_subnet.subnetsection.id
}