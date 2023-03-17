resource "aws_iam_role" "task-role" {
  name = "${var.task_name}-task-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
  managed_policy_arns = [aws_iam_policy.task-policy.arn]

}

resource "aws_iam_policy" "task-policy" {
  name = "${var.task_name}-task-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
            "ecs:*"
        ]
        Effect = "Allow"
        Resource = [
            "*"
        ]
      },
      {
        Action = [
            "iam:GetRole",
            "iam:PassRole"
        ]
        Effect = "Allow"
        Resource = [
            "${aws_iam_role.task-execution-role.arn}"
        ]
      }      
    ]
  })  
}

resource "aws_iam_role" "task-execution-role" {
  name = "${var.task_name}-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
  managed_policy_arns = [aws_iam_policy.ecs-policy.arn]

}




resource "aws_iam_policy" "ecs-policy" {
  name = "${var.task_name}-execution-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
            "ecr:GetAuthorizationToken",
            "ecr:BatchCheckLayerAvailability",
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
        ]
        Effect = "Allow"
        Resource = [
            "*"
        ]
      }
    ]
  })  
}

resource "aws_lb" "lb" {
    internal = false
    name = "${var.task_name}-lb"
    load_balancer_type = "application"
    subnets = var.public_subnets
    security_groups = [aws_security_group.lb-security-group.id]
    tags = {
      provisioner = var.provisioner
      environment = var.environment       
    }
  
}

resource "aws_lb_target_group" "lb-target-group" {
    name = "${var.task_name}-lb-tg"
    port = 80
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = var.vpc_id
    
    health_check {
      port = 80
      protocol = "HTTP"
      path = "/status"
    }

  
}

resource "aws_lb_listener" "lb-listener" {
    load_balancer_arn = aws_lb.lb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.lb-target-group.arn
    }
  
}

resource "aws_security_group" "lb-security-group" {

  name        = "${var.task_name}-sg"
  description = "Load balancer security group"
  vpc_id      = var.vpc_id
  ingress {
    description = "Open for application"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # security_groups = [var.webserver_sg_id]
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.task_name}-sg"
    provisioner = var.provisioner
    environment = var.environment
  }

}

resource "aws_security_group" "ecs-service-security-group" {

  name        = "${var.service_name}-sg"
  description = "Load balancer security group"
  vpc_id      = var.vpc_id
  ingress {
    description = "Open for application"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # security_groups = [var.webserver_sg_id]
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.service_name}-sg"
    provisioner = var.provisioner
    environment = var.environment
  }

}