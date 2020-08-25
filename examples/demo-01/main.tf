module "aws-batch" {
  source = "../../"
  #version = "0.1.0"

  vpc_id          = aws_vpc.main.id
  security_groups = [aws_security_group.trusted.id]
  ce_name         = "Demo-CE"
  instance_type   = "optimal"

  // We take the Job definition file from the ./data directory and we need to render it as a file
  ecs_container_properties = file("./data/job_definition.json")

  // Compute Environment configuration.
  desired_vcpu = 1
  max_vcpu     = 2
  min_vcpu     = 0

  // Jobs with lowest priority are scheduled fist.
  batch_job_queue_priority = 10
}
