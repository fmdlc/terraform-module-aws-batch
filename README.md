# terraform-aws-batch-module
![](https://img.shields.io/github/languages/code-size/fmdlc/terraform-module-aws-batch) ![](https://img.shields.io/github/downloads/fmdlc/terraform-module-aws-batch/total) ![https://github.com/fmdlc/terraform-module-aws-batch/issues](https://img.shields.io/github/issues-raw/fmdlc/terraform-module-aws-batch) ![https://www.apache.org/licenses/LICENSE-2.0](https://img.shields.io/github/license/fmdlc/terraform-module-aws-batch) ![https://www.terraform.io/](https://img.shields.io/badge/terraform-v0.13.0-purple)

This module helps to create an [AWS Batch stack](https://docs.aws.amazon.com/batch/latest/userguide/what-is-batch.html) within VPC. For more details about creating AWS Batch stacks, please see:
* [Terraform batch_compute_environment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment)
* [Terraform batch_job_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_definition)
* [Terraform batch_job_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_queue)
## Requirements
|Name|Version|
|---|---|
|terraform | `>= 0.12.6`|
|aws| `>= 3.0.0`|

* VPC (*default/custom*) should be present.
* ECR and Docker image should be present.

## Usage

#### Get HashiCorp Terraform and Terraform AWS Provider
* [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
* [https://github.com/terraform-providers/terraform-provider-aws](https://github.com/terraform-providers/terraform-provider-aws)

```hcl-terrarform
provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  profile                 = "customprofile"
}
```
#### Instance the module from your Terraform code:

```hcl-terraform
module "batch" {
  source                    = "git:ssh://git@github.com:fmdlc/terraform-module-aws-batch.git?ref=v0.1.0"
  vpc_id                    = aws_vpc.main.id
  security_groups           = aws_security_group.batch_sg.id
  ce_name                   = "My-default-Compute-Environment"
  instance_type             = "t2.medium"
  ecs_container_properties  = FILE
  tags                      = map(module.tags.tags)
}
```

## Properties
The following properties has been defined as variables in order to pass data to the Terraform's module.

| Name | Type | Default | Required | Description|
|---|---|---|---|---|
|`vpc_id`                   |`string`| --       |True |VPC ID to launch Compute Environment.
|`security_group`           |`list`  | --       |True |Security groups to be used by Compute Environment.
|`ce_name`                  |`string`| --       |True |Given name for Compute Environment.
|`instance_type`            |`string`| --       |True |The instance_type for compute environment to use.
|`ecs_containerr_properties`|`map`   | --       |False |"A valid container properties provided as a single valid JSON document.|
|`ce_type`                  |`string`|`EC2`     |False |A valid container properties provided as a single valid JSON document.
|`ce_allocation_strategy`   |`string`|`BEST_FIT`|False | The allocation strategy to use for compute resource.
|`max_vcpu`                 |`int`   |32        |False |Maximum allowed VCPUs allocated to instances.
|`min_vcpu`                 |`int`   |0         |False |Minimum number of VCPUs allocated to instances.
|`desired_vcpu`             |`int`   |2         |False |Desired number of VCPUs allocated to instances.
|`batch_job_definition_name` |`string`|batch-job-definition |False |Batch Job definition name.
|`batch_job_queue_name`     |`string`|batch-job-queue     |False |Batch Job queue name.
|`batch_job_queue_state`    |`string`|`ENABLED`           |False|State of the created Job Queue.
|`batch_job_queue_priority` |`int`   |100                 |False|Priority of the created Job Queue.
|`tags`|`map`| -- | False | Tags passed to module resources.

## Output
The module outputs the following values.
| Name | Description  
|---|---         
|`compute_environment_resources_arn` | Compute Environment ARN.
|`compute_environment_name` | Compute Environment name. 
|`compute_environment_state` | Compute Environment state.
|`job_definition_arn` | Job definition ARN.
|`job_definition_container_properties` | Job definition properties.
|`job_definition_container_parameters` | Job definition parameters.
|`job_queue_arn`   | Job queue ARN.
|`job_queue_state` | Job queue state.
|`subnet_ids`      | Subnets used for resources creation.

## Known issues
No known issues so far.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.

## License
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)