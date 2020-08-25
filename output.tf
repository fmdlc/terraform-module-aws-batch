// Compute Environment
output "compute_environment_resources_arn" {
  description = "The CE resources."
  value       = aws_batch_compute_environment.compute-environment.arn
}

output "compute_environment_name" {
  description = "The CE name."
  value       = aws_batch_compute_environment.compute-environment.compute_environment_name
}

output "compute_environment_state" {
  description = "The CE state."
  value       = aws_batch_compute_environment.compute-environment.state
}

// Job definition
output "job_definition_arn" {
  description = "The Job definition ARN."
  value       = aws_batch_job_definition.job-definition.arn
}

output "job_definition_container_properties" {
  description = "The Job definition container properties."
  value       = aws_batch_job_definition.job-definition.container_properties
}

output "job_definition_container_parameters" {
  description = "The Job definition parameters"
  value       = aws_batch_job_definition.job-definition.parameters
}

// Job queue
output "job_queue_arn" {
  description = "The Job queue ARN."
  value       = aws_batch_job_queue.job_queue.arn
}

output "job_queue_state" {
  description = "Job queue state"
  value       = aws_batch_job_queue.job_queue.state
}

// Others
output "subnet_ids" {
  description = "Subnet IDs where Compute Environment runs."
  value       = data.aws_subnet_ids.subnets.ids
}

