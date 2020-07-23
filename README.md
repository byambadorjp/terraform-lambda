# terraform-lambda

# Deploy Hello-World lambda using Terraform with AWS CLI

### Prerequisite for deploy lambda

### Install Terraform manually
Go to https://www.terraform.io/downloads.html. Find the appropriate package for your system and download it as a zip archive.
After downloading Terraform, unzip the package. Terraform runs as a single binary named terraform.

Finally, make sure that the ```terraform``` binary is available on your PATH.
```
export PATH="$PATH:<your_terraform_location>"
```

Verify the installation.
```
terraform -help
```

#### Install aws cli tool
Go to https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html.
Install command-line tool for AWS and generating temporary Amazon AWS Credentials. 

Find credentials from https://console.aws.amazon.com/iam/home?#security_credential

```
aws configure
```

### Initialize a working directory containing Terraform configuration files
Terraform will use "default" profile on aws credential file "~/.aws/credentials".
```
terraform init
```

### Create an execution plan. 
Terraform performs a refresh and then determines what actions are necessary to achieve the desired state specified in the configuration files
```
terraform plan
```

### Deploy lamdbda to the specific environment
```
terraform apply
```

### To test Lambda run command below
```
aws lambda invoke --region=us-west-2 --function-name=hello_lambda output.txt
```
