provider "aws" {
    region = "us-east-1"
}
resource "aws_iam_user" "template" {
    name = "temper"
}
resource "aws_iam_access_key" "accesskey" {
    user = aws_ima_user.template.name
}
resource "aws_iam_user_policy" "policy" {
    name = "instancepolicycheck"
    user = "${aws_iam_user.template.name}"
    policy = templatefile("${path.module}/user-policy.tftpl", {
        ec2_policies = [

                "ec2:RunInstances",
                "ec2:StopInstances",
                "ec2:StartInstanecs",
                "ec2:TerminateInstances",
                "ec2:Describe*",
                "ec2:CreateTags",
        ]
    })
}
output "secret_key" {
    value = aws_iam_access_key.accesskey.id
    sensitive = true
}
output "access_key" {
    value = aws_iam_access_key.accesskey.id
}