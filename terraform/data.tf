data "aws_route53_zone" "existing_zone" {
  name = "rails.sandbox.rizap.jp"
}

data "aws_ecr_repository" "existing_repo" {
  name = "rails-application"
}

data "aws_ecs_cluster" "existing_cluster" {
  cluster_name = "rails-application-sandbox"
}

data "aws_ecs_task_definition" "existing_task" {
  task_definition = "rails-application"
}

data "aws_cloudfront_distribution" "existing_cdn" {
  id = "E3IBS29LVVGCG4"
}

data "aws_lb" "selected" {
  name = "rails-application-sandbox"
}

data "aws_lb_listener" "selected443" {
  load_balancer_arn = data.aws_lb.selected.arn
  port              = 443
}

data "aws_security_group" "alb_sg" {
  id = "sg-0aa5628c520efc72b" # 既存のALB用SG
}

data "aws_security_group" "ecs_sg" {
  id = "sg-0f5982743fee0a586" # 既存のECS用SG
}

data "aws_vpc" "default" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  tags = {
    Tier = "sandbox"
  }
}
