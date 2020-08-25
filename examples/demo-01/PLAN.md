## Initializing
> Execute `terraform init`
```
$: terraform init
```

## Creating a plan
> Execute `terraform plan`
```hcl
$: terraform plan

Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # data.aws_subnet_ids.public_subnets will be read during apply
  # (config refers to values not yet known)
 <= data "aws_subnet_ids" "public_subnets"  {
      + id     = (known after apply)
      + ids    = (known after apply)
      + tags   = (known after apply)
      + vpc_id = (known after apply)
    }

  # aws_internet_gateway.main will be created
  + resource "aws_internet_gateway" "main" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name"      = "main"
          + "Terraform" = "True"
        }
      + vpc_id   = (known after apply)
    }

  # aws_route_table.route-us-east-1["us-east-1a"] will be created
  + resource "aws_route_table" "route-us-east-1" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "Name"      = "main"
          + "Terraform" = "True"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.route-us-east-1["us-east-1b"] will be created
  + resource "aws_route_table" "route-us-east-1" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "Name"      = "main"
          + "Terraform" = "True"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.route-us-east-1["us-east-1c"] will be created
  + resource "aws_route_table" "route-us-east-1" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "Name"      = "main"
          + "Terraform" = "True"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.us-east-1[0] will be created
  + resource "aws_route_table_association" "us-east-1" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.us-east-1[1] will be created
  + resource "aws_route_table_association" "us-east-1" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.us-east-1[2] will be created
  + resource "aws_route_table_association" "us-east-1" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.trusted will be created
  + resource "aws_security_group" "trusted" {
      + arn                    = (known after apply)
      + description            = "Trusted Security Group for trusted address"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "10.0.0.0/16",
                ]
              + description      = "Allow internal access"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + name                   = "trusted_sg"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name"      = "TrustedSG"
          + "Terraform" = "True"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.main-us-east["us-east-1a"] will be created
  + resource "aws_subnet" "main-us-east" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.1.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"      = "subnet-us-east-1a"
          + "Terraform" = "True"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.main-us-east["us-east-1b"] will be created
  + resource "aws_subnet" "main-us-east" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.2.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"      = "subnet-us-east-1b"
          + "Terraform" = "True"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.main-us-east["us-east-1c"] will be created
  + resource "aws_subnet" "main-us-east" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1c"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.3.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"      = "subnet-us-east-1c"
          + "Terraform" = "True"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.0.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name"      = "main"
          + "Terraform" = "True"
        }
    }

  # module.aws-batch.data.aws_subnet_ids.subnets will be read during apply
  # (config refers to values not yet known)
 <= data "aws_subnet_ids" "subnets"  {
      + id     = (known after apply)
      + ids    = (known after apply)
      + tags   = (known after apply)
      + vpc_id = (known after apply)
    }

  # module.aws-batch.aws_batch_compute_environment.compute-environment will be created
  + resource "aws_batch_compute_environment" "compute-environment" {
      + arn                      = (known after apply)
      + compute_environment_name = "Demo-Compute-Environment"
      + ecs_cluster_arn          = (known after apply)
      + id                       = (known after apply)
      + service_role             = (known after apply)
      + state                    = "ENABLED"
      + status                   = (known after apply)
      + status_reason            = (known after apply)
      + type                     = "MANAGED"

      + compute_resources {
          + allocation_strategy = "BEST_FIT"
          + desired_vcpus       = 1
          + instance_role       = (known after apply)
          + instance_type       = [
              + "t2.small",
            ]
          + max_vcpus           = 2
          + min_vcpus           = 0
          + security_group_ids  = (known after apply)
          + subnets             = (known after apply)
          + type                = "EC2"
        }
    }

  # module.aws-batch.aws_batch_job_definition.job-definition will be created
  + resource "aws_batch_job_definition" "job-definition" {
      + arn                  = (known after apply)
      + container_properties = jsonencode(
            {
              + command     = [
                  + "ls",
                  + "-la",
                ]
              + environment = [
                  + {
                      + name  = "VARNAME"
                      + value = "VARVAL"
                    },
                ]
              + image       = "busybox"
              + memory      = 1024
              + mountPoints = [
                  + {
                      + containerPath = "/tmp"
                      + readOnly      = false
                      + sourceVolume  = "tmp"
                    },
                ]
              + ulimits     = [
                  + {
                      + hardLimit = 1024
                      + name      = "nofile"
                      + softLimit = 1024
                    },
                ]
              + vcpus       = 1
              + volumes     = [
                  + {
                      + host = {
                          + sourcePath = "/tmp"
                        }
                      + name = "tmp"
                    },
                ]
            }
        )
      + id                   = (known after apply)
      + name                 = "batch-job-definition"
      + revision             = (known after apply)
      + type                 = "container"
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

  # module.aws-batch.aws_iam_instance_profile.ecs_instance_role will be created
  + resource "aws_iam_instance_profile" "ecs_instance_role" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "ecs_instance_role"
      + path        = "/"
      + role        = "ecs_instance_role"
      + unique_id   = (known after apply)
    }

  # module.aws-batch.aws_iam_role.aws_batch_service_role will be created
  + resource "aws_iam_role" "aws_batch_service_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "batch.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "aws_batch_service_role"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # module.aws-batch.aws_iam_role.ecs_instance_role will be created
  + resource "aws_iam_role" "ecs_instance_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "ecs_instance_role"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # module.aws-batch.aws_iam_role_policy_attachment.aws_batch_service_role will be created
  + resource "aws_iam_role_policy_attachment" "aws_batch_service_role" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
      + role       = "aws_batch_service_role"
    }

  # module.aws-batch.aws_iam_role_policy_attachment.ecs_instance_role_ec2 will be created
  + resource "aws_iam_role_policy_attachment" "ecs_instance_role_ec2" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
      + role       = "ecs_instance_role"
    }

  # module.aws-batch.aws_iam_role_policy_attachment.ecs_instance_role_s3 will be created
  + resource "aws_iam_role_policy_attachment" "ecs_instance_role_s3" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
      + role       = "ecs_instance_role"
    }

Plan: 21 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```
