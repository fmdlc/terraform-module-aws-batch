# terraform-aws-batch-module
![](https://img.shields.io/github/languages/code-size/fmdlc/terraform-module-aws-batch) ![](https://img.shields.io/github/downloads/fmdlc/terraform-module-aws-batch/total) ![https://github.com/fmdlc/terraform-module-aws-batch/issues](https://img.shields.io/github/issues-raw/fmdlc/terraform-module-aws-batch) ![https://www.apache.org/licenses/LICENSE-2.0](https://img.shields.io/github/license/fmdlc/terraform-module-aws-batch) ![https://www.terraform.io/](https://img.shields.io/badge/terraform-v0.13.0-purple)

[![Linkedin](https://i.stack.imgur.com/gVE0j.png) LinkedIn](https://www.linkedin.com/in/fmdlc) [![GitHub](https://i.stack.imgur.com/tskMh.png) GitHub](https://github.com/fmdlc)

This module helps to create an [AWS Batch stack](https://docs.aws.amazon.com/batch/latest/userguide/what-is-batch.html) within VPC. For more details about creating AWS Batch stacks, please see:
* [Terraform batch_compute_environment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment)
* [Terraform batch_job_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_definition)
* [Terraform batch_job_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_queue)

## Standard architecture
A job definition specifies how jobs are to be run—for example, which Docker image to use for your job, how many vCPUs and how much memory is required, the IAM role to be used, and more.

Jobs are submitted to job queues where they reside until they can be scheduled to run on Amazon EC2 instances within a compute environment. An AWS account can have multiple job queues, each with varying priority. This gives you the ability to closely align the consumption of compute resources with your organizational requirements.

Compute environments provision and manage your EC2 instances and other compute resources that are used to run your AWS Batch jobs. Job queues are mapped to one more compute environments and a given environment can also be mapped to one or more job queues. This many-to-many relationship is defined by the compute environment order and job queue priority properties.

The following diagram shows a general overview of how the AWS Batch resources interact.

![https://aws.amazon.com/blogs/compute/using-aws-cloudformation-to-create-and-manage-aws-batch-resources/](https://d2908q01vomqb2.cloudfront.net/1b6453892473a467d07372d45eb05abc2031647a/2018/04/23/AWSBatchresoucreinteract-diagram.png)

> **Ref:** 
> [Using AWS CloudFormation to Create and Manage AWS Batch Resources](https://d2908q01vomqb2.cloudfront.net/1b6453892473a467d07372d45eb05abc2031647a/2018/04/23/AWSBatchresoucreinteract-diagram.png)

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
module "aws-batch" {
  source                    = "fmdlc/aws-batch/module"
  version                   = "0.1.0"
  vpc_id                    = aws_vpc.main.id
  security_groups           = [aws_security_group.trusted.id]
  ce_name                   = "Demo-Compute-Environment"
  ecs_container_properties  = file("./data/job_definition.json")
}
```

### Expeced output
```hcl
 # module.aws-batch.aws_batch_compute_environment.compute-environment will be created
  + resource "aws_batch_compute_environment" "compute-environment" {
      + arn                      = (known after apply)
      + compute_environment_name = "Demo-Compute-Environment"
      + ecs_cluster_arn          = (known after apply)
      + id                       = (known after apply)
      + service_role             = "arn:aws:iam::0000000:role/ecs_instance_role"
      + state                    = "ENABLED"
      + status                   = (known after apply)
      + status_reason            = (known after apply)
      + type                     = "MANAGED"

      + compute_resources {
          + allocation_strategy = "BEST_FIT"
          + desired_vcpus       = 1
          + instance_role       = "arn:aws:iam::0000000:instance-profile/ecs_instance_role"
          + instance_type       = [
              + "optimal",
            ]
          + max_vcpus           = 2
          + min_vcpus           = 0
          + security_group_ids  = [
              + "sg-06a318b4f02a7eb47",
            ]
          + subnets             = [
              + "vpc-0e03ccaab971ce9cc",
            ]
          + type                = "EC2"
        }
    }

  # module.aws-batch.aws_batch_job_queue.job_queue will be created
  + resource "aws_batch_job_queue" "job_queue" {
      + arn                  = (known after apply)
      + compute_environments = (known after apply)
      + id                   = (known after apply)
      + name                 = "batch-job-queue"
      + priority             = 10
      + state                = "ENABLED"
    }
 ```

## Properties
The following properties has been defined as variables in order to pass data to the Terraform's module.

| Name | Type | Default | Required | Description|
|---|---|---|---|---|
|`vpc_id`                   |`string`| --       |True |VPC ID to launch Compute Environment.
|`security_group`           |`list`  | --       |True |Security groups to be used by Compute Environment.
|`ce_name`                  |`string`| --       |True |Given name for Compute Environment.
|`instance_type`            |`string`| `optimal`|True |The instance_type for compute environment to use.
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

## Output
The module outputs the following values.

|Name| Description |
|---|---|         
|`compute_environment_resources_arn` | Compute Environment ARN.
|`compute_environment_name` | Compute Environment name. 
|`compute_environment_state` | Compute Environment state.
|`job_definition_arn` | Job definition ARN.
|`job_definition_container_properties` | Job definition properties.
|`job_definition_container_parameters` | Job definition parameters.
|`job_queue_arn`   | Job queue ARN.
|`job_queue_state` | Job queue state.
|`subnet_ids`      | Subnets used for resources creation.

## Job definition JSON template
```json
{
    "command": ["ls", "-la"],
    "image": "busybox",
    "memory": 1024,
    "vcpus": 1,
    "volumes": [
      {
        "host": {
          "sourcePath": "/tmp"
        },
        "name": "tmp"
      }
    ],
    "environment": [
        {"name": "VARNAME", "value": "VARVAL"}
    ],
    "mountPoints": [
        {
          "sourceVolume": "tmp",
          "containerPath": "/tmp",
          "readOnly": false
        }
    ],
    "ulimits": [
      {
        "hardLimit": 1024,
        "name": "nofile",
        "softLimit": 1024
      }
    ]
}
```

## Known issues
No known issues so far.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.

## License
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)
