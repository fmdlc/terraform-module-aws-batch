variable "vpc_id" {
  description = "VPC ID to launch Compute Environment."
  type        = string
}

variable "security_groups" {
  description = "Security groups to be used by the Compute Environment."
  type        = list
}

variable "ce_name" {
  description = "Given name for the Compute Environment."
  type        = string
}

// The instance types that may be launched. You can specify instance families to launch any instance type within
// those families (for example, c5, c5n, or p3), or you can specify specific sizes within a family (such as c5.8xlarge).
// Note that metal instance types are not in the instance families (for example c5 does not include c5.metal.)
// You can also choose optimal to pick instance types (from the C, M, and R instance families) on the fly that match the
// demand of your job queues
variable "instance_type" {
  description = "The instance_type for compute environment to use."
  type        = string
  default     = "optimal"
}

// Map or json file with defined ec2_container_properties.
variable "ecs_container_properties" {
  description = "A valid container properties provided as a single valid JSON document."
}

variable "ce_type" {
  description = "Compute Environment type."
  type        = string
  default     = "MANAGED"
}

// Valid items are BEST_FIT_PROGRESSIVE, SPOT_CAPACITY_OPTIMIZED or BEST_FIT.
variable "ce_allocation_strategy" {
  description = "The allocation strategy to use for the compute resource."
  default     = "BEST_FIT"
}

variable "max_vcpu" {
  description = "Maximum allowed VCPUs allocated to instances."
  type        = number
  default     = 32
}

variable "min_vcpu" {
  description = "Minimum number of VCPUs allocated to instances."
  type        = number
  default     = 0
}

variable "desired_vcpu" {
  description = "Desired number of VCPUs allocated to instances."
  type        = number
  default     = 2
}

variable "batch_job_definition_name" {
  description = "Batch Job definition name."
  type        = string
  default     = "batch-job-definition"
}

variable "batch_job_queue_name" {
  description = "Batch Job queue name."
  type        = string
  default     = "batch-job-queue"
}

// Must be either ENABLED or DISABLED.
variable "batch_job_queue_state" {
  description = "State of the created Job Queue."
  type        = string
  default     = "ENABLED"
}

// The priority of the job queue. Job queues with a higher priority are evaluated first when associated
// with the same compute environment.
variable "batch_job_queue_priority" {
  description = "Priority of the created Job Queue."
  type        = string
  default     = "100"
}