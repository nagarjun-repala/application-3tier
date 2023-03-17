output "task_role_arn" {
    value = module.ecs_config.task_role_arn
}

output "task_execution_role_arn" {
    value = module.ecs_config.task_execution_role_arn
  
}

output "app_lb_endpoint" {
    value = module.ecs_config.app_lb_endpoint
  
}