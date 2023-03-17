provider "aws" {
    region = "us-east-1"
    
}

module "ecs_config" {
    source = "../modules/ecs-service"
    environment = var.environment
    service_name = var.service_name
    cluster_id = data.terraform_remote_state.ecs_cluster.outputs.cluster_id
    private_subnets = [data.terraform_remote_state.vpc.outputs.private_subnet_az1, data.terraform_remote_state.vpc.outputs.private_subnet_az2]
    task_name = var.task_name
    public_subnets = [data.terraform_remote_state.vpc.outputs.public_subnet_az1, data.terraform_remote_state.vpc.outputs.public_subnet_az2]
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    vpc_cidr = data.terraform_remote_state.vpc.outputs.vpc_cidr
      
}

resource "aws_ecs_service" "ecs-service" {
    name = var.service_name
    cluster = data.terraform_remote_state.ecs_cluster.outputs.cluster_id
    task_definition = aws_ecs_task_definition.ecs-task-definition.arn
    desired_count = 1
    launch_type = "FARGATE"
    platform_version = "1.4.0"
    network_configuration {
        subnets = [data.terraform_remote_state.vpc.outputs.private_subnet_az1, data.terraform_remote_state.vpc.outputs.private_subnet_az2]
        security_groups = [module.ecs_config.ecs_service_sg_id]
        assign_public_ip = false
    }
    load_balancer {
        target_group_arn = module.ecs_config.lb_target_group_arn
        container_name = "${var.task_name}-container"
        container_port = 80
      
    }

    tags = {
      provisioner = var.provisioner
      environment = var.environment       
    }
  
}




resource "aws_ecs_task_definition" "ecs-task-definition" {
    family = var.task_name
    requires_compatibilities = ["FARGATE"]
    network_mode = "awsvpc"
    cpu = 512
    memory = 1024
    task_role_arn = module.ecs_config.task_role_arn
    execution_role_arn = module.ecs_config.task_execution_role_arn
    container_definitions = jsonencode([
        {
            name = "${var.task_name}-container"
            image = "${var.image_uri}"
            command = ["nginx", "-g", "daemon off;"]
            environment = [
                {
                    name = "REACT_APP_BACKEND_BASE_URL"
                    value = "${var.backend_url}"
                }                                              
            ]            
            cpu = 512
            memory = 1024
            essential = true
            portMappings = [
                {
                    containerPort = 80
                    hostPort = 80
                }
            ]
        }
    ])
}