locals {
    file_path = "./hello-world/"
    zip_file_path = "./build/"
    zip_file_name = "lambda.zip"
}

data "archive_file" "archive_functions" {
    type = "zip"
    source_dir = "${local.file_path}"
    output_path = "${local.zip_file_path}${local.zip_file_name}"
}

provider "aws" {
    profile = "default"
    region = "us-west-2"
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "lambda_exec" {
    name = "serverless_example_lambda"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
       "Action": "sts:AssumeRole",
       "Principal": {
         "Service": "lambda.amazonaws.com"
       },
       "Effect": "Allow",
       "Sid": ""
    }
    ]
}
 EOF
}

 resource "aws_lambda_function" "example" {
    function_name = "hello_lambda"

    filename = "${local.zip_file_path}${local.zip_file_name}"

    handler = "main.handler"
    runtime = "nodejs10.x"
    source_code_hash = "${data.archive_file.archive_functions.output_base64sha256}"

    role = aws_iam_role.lambda_exec.arn
}