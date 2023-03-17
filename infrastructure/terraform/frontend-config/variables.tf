variable "task_name" {
    type = string
    default = "frontend-app"
    description = "task name" 
}

variable "image_uri" {
    type = string
    default = "<image uri>/frontend-app:latest"
    description = "Image uri"
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
    default = "frontend"
}

variable "backend_url" {
    type = string
    description = "backend url"
    default = "backend base url"
}