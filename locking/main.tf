provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "workinstance" {
    ami = "ami-054965c6cd7c6e462"
    instance_type = t2.micro
}
terraform {
    backend "s3" {
        bucket = "bucketnameterr"
        key = "folder/terraform.tfstate"
        encrypt = true
        region = "us-east-1"
        dynamodb_table = "dynamodb_state-locking" #key should be LockID

    }
}