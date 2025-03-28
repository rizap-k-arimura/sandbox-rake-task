# ECS service
resource "aws_ecs_service" "default" {
  name            = var.service_name
  cluster         = data.aws_ecs_cluster.existing_cluster.id
  task_definition = data.aws_ecs_task_definition.existing_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true # 検証用ではpublic subnet
    subnets          = data.aws_subnets.private.ids
    security_groups  = [data.aws_security_group.ecs_sg.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.http_80.arn
    container_name   = "nginx"
    container_port   = 80
  }
}

# ALB
resource "aws_lb_target_group" "http_80" {
  name        = "${local.resource_prefix}-${var.subdomain}"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.default.id
  target_type = "ip"

  health_check {
    enabled = true
    path    = "/"
  }
}

resource "aws_lb_listener_rule" "host_based" {
  listener_arn = data.aws_lb_listener.selected443.arn
  priority     = var.listener_priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_80.arn
  }

  condition {
    host_header {
      values = ["${var.subdomain}.${var.domain_name}"]
    }
  }
}
