provider "aws" {
    region = "us-east-1"
}
locals {
    instance_name = "${terraform.workspace}-instance"
}
resource "aws_instance" "workinstance" {
    ami = "ami-054965c6cd7c6e462"
    instance_type = var.instance_type
}