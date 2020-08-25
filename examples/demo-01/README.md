# aws-batch-module demo

[![Linkedin](https://i.stack.imgur.com/gVE0j.png) LinkedIn](https://www.linkedin.com/in/fmdlc)
&nbsp;
[![GitHub](https://i.stack.imgur.com/tskMh.png) GitHub](https://github.com/fmdlc)
## Setup

1) Download [Terraform v0.13.0](https://www.terraform.io/downloads.html) for your Operating System.
2) Login into your AWS account, crete a IAM user, then create a set of IAM credentials and store them in a safe place.
3) Configure your AWS environment (be sure to have the `aws CLI` tool installed).
4) Configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html): ```aws config```and enter the IAM credentials that you created before.
5) Create an empty [S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bucket.html) in the `us-east-1` AWS region, make it private and use the created bucket name to configure the `backend.tf`.
6) Execute [terraform init](https://www.terraform.io/docs/commands/init.html) to initialize the providers.

## How to run
##### Initialize terraform
```hcl-terraform
$: terraform init
```
##### Create a Terraform plan
```hcl-terraform
$: terraform plan
```
For more details about the expected Terraform Plan please check [PLAN.md](./PLAN.md).
#### Applying the plan
```hcl-terraform
$: terraform apply
```
#### Clean up
```
$: terraform destroy
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.

## License
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)
