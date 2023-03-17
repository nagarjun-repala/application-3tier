output "task_role_arn" {
    value = aws_iam_role.task-role.arn
  
}

output "task_execution_role_arn" {
    value = aws_iam_role.task-execution-role.arn
  
}

output "lb_target_group_arn" {
    value = aws_lb_target_group.lb-target-group.arn
  
}

output "ecs_service_sg_id" {
    value = aws_security_group.ecs-service-security-group.id 
}

output "app_lb_endpoint" {
    value = aws_lb.lb.dns_name
  
}