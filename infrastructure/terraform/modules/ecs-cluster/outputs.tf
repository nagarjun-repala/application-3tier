output "cluster_name" {
    value = aws_ecs_cluster.name
}

output "cluster_id" {
    value = aws_ecs_cluster.name.id
}

output "clustern_arn" {
    value = aws_ecs_cluster.name.arn
}