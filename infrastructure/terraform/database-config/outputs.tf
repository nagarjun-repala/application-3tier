output "db_endpoint" {
    value = module.database_config.db_endpoint
    description = "DB endpoint"
}

output "db_port" {
    value = module.database_config.db_port
    description = "db port"
}