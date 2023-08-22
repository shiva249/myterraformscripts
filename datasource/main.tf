provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "example" {
   ami = "ami-054965c6cd7c6e462"
   instance_type = "t2.micro"
   tags = {
    name = "datasource"
   }
}
data "aws_instance" "datasource" {
    filter {
        name = "tag:name"
        values = ["datasource"]
    depends_on = {
        "aws_instance.example"
    }
    }
}
output "fetched_info_from_aws" {
    values = data.aws_instance.datasource.public_ip
}