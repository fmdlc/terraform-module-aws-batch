resource "aws_batch_compute_environment" "compute-environment" {
	compute_environment_name = var.ce_name

	compute_resources {
		instance_role = aws_iam_instance_profile.ecs_instance_role.arn
		instance_type = var.instance_type
		max_vcpus = var.max_vcpu
		min_vcpus = var.min_vcpu
		desired_vcpus = var.desired_vcpu
		allocation_strategy = var.ce_allocation_strategy
		security_group_ids = [var.security_groups]
		subnets = [data.aws_subnet_ids.subnets.id]
		type = var.instance_type
		service_role = aws_iam_role.ecs_instance_role.arn
	}

	type = var.ce_type
	service_role = aws_iam_role.aws_batch_service_role.arn
	tags = var.tags

	// To prevent a race condition during environment deletion, make sure to set depends_on to the related
	// aws_iam_role_policy_attachment; otherwise, the policy may be destroyed too soon and the compute environment
	// will then get stuck in the DELETING.
	// ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment
	depends_on = [aws_iam_role_policy_attachment.aws_batch_service_role]
}

resource "aws_batch_job_queue" "job_queue" {
	name = var.batch_job_queue_name
	state = var.batch_job_queue_state
	priority = var.batch_job_queue_priority
	compute_environments = [aws_batch_compute_environment.compute-environment.arn]
	tags = var.tags
}

resource "aws_batch_job_definition" "job-definition" {
	name = var.batch_job_definition_name
	type = "container"
	container_properties = var.ecs_container_properties
	tags = var.tags
}