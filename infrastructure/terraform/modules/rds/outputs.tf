output "db_endpoint" {
    value = aws_db_instance.database.endpoint
}
output "db_port" {
    value = aws_db_instance.database.port 
}