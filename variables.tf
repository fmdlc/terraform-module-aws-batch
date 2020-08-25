variable "vpc_id" {
  description = "VPC ID to launch Compute Environment."
  type        = string
}

variable "security_groups" {
  description = "Security groups to be used by the Compute Environment."
  type        = list(string)
}

variable "ce_name" {
  description = "Given name for the Compute Environment."
  type        = string
}

variable "instance_type" {
  description = "The instance_type for compute environment to use."
  type        = list(string)
}

variable "tags" {
  description = "AWS resources tags"
  type        = string
  default     = ""
}

// Map or json file with defined ec2_container_properties.
variable "ecs_container_properties" {
  description = "A valid container properties provided as a single valid JSON document."
}

// EC2 or SPOT
variable "ce_type" {
  description = "Compute Environment type."
  type        = string
  default     = "EC2"
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