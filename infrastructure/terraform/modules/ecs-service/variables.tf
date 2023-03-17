variable "provisioner" {
    type = string
    description = "provisioner"
    default = "terraform"
}

variable "environment" {
    type = string
    description = "environemt"
}

variable "service_name" {
    type = string
    description = "service name"
}

variable "cluster_id" {
    type = string
    description = "ecs cluster id"
}


variable "private_subnets" {
    type = list
    description = "private subnet for ecs"
  
}

variable "task_name" {
    type = string
    description = "task name"
}


variable "public_subnets" {
    type = list
    description = "public subnet for ecs"
  
}

variable "vpc_id" {
    type = string
    description = "vpc id"
  
}

variable "vpc_cidr" {
    type = string
    description = "vpc cidr"
  
}
