provider "aws" {
    region = "us-east-1"
}
locals {
    ingress_rules = [{
        port = 443
        description = "Ingress rule for 443"
    }
    {
        Port = 22
        description = "Ingress rule for 22"
    }
    ]
}
resource "aws_instance" "terr-first" {
    ami = "ami-026ebd4cfe2c043b2"
    instance_type = "t2.micro"
    key_name = "AWS"
    vpc_secuirity_group_ids = [aws_secuirity_group.main.id]
    tags = {
        Name = "terra-practise-1"
    }
}
dynamic "ingress" {
    for_each = local.ingress_rules
 
 content {
    description = ingress.value.description
    from_port = ingress.value.port
    to_port = ingress.value.port
    protocal = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }
}
x