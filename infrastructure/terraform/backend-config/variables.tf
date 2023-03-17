variable "task_name" {
    type = string
    default = "app"
    description = "task name" 
}

variable "image_uri" {
    type = string
    default = "<image uri>/backend-app:latest"
    description = "Image uri"
}

variable "database_endpoint" {
    type = string
    default = "localhost"
    description = "database endpoint"
}

variable "database_username" {
    type = string
    default = "admin"
    description = "database username"
}

variable "database_password" {
    type = string
    default = "admin123456"
    description = "database password"
}

variable "server_port" {
    type = string
    default = "80"
    description = "app server running port"
}

variable "database_name" {
    type = string
    default = "userdata"
    description = "database port"
  
}

variable "provisioner" {
    type = string
    description = "provisioner"
    default = "terraform"
}

variable "environment" {
    type = string
    description = "environemt"
    default = "dev"
}

variable "service_name" {
    type = string
    description = "service name"
    default = "backend"
}