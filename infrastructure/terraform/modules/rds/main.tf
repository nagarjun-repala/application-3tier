resource "aws_db_subnet_group" "db-subnet-group" {

  name = "${var.identifier_name}-subnet-group"
  subnet_ids = var.db_subnet_ids
  tags = {
    Name = "${var.identifier_name}-subnet-group"
  }
  
}


resource "aws_db_instance" "database" {
    allocated_storage = var.storage
    engine = "mysql"
    engine_version = var.engine_version
    instance_class = var.instance_class
    identifier = var.identifier_name
    db_name = var.db_name
    username = var.db_user
    password = var.db_password
    storage_type = var.storage_type
    publicly_accessible = var.public_access
    db_subnet_group_name = aws_db_subnet_group.db-subnet-group.name
    vpc_security_group_ids = [aws_security_group.db-security-group.id]
    skip_final_snapshot = true
    tags = {
      provisioner = var.provisioner
      environment = var.environment       
    }
}

resource "aws_security_group" "db-security-group" {

  name        = "${var.identifier_name}-sg"
  description = "Database security group"
  vpc_id      = var.vpc_id
  ingress {
    description = "Open db port for connection request from the application"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    # security_groups = [var.webserver_sg_id]
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = [var.vpc_cidr, "0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.identifier_name}-sg"
    provisioner = var.provisioner
    environment = var.environment
  }

}

resource "aws_secretsmanager_secret" "secret-name" {
  name                    = "${var.identifier_name}-secret"
  recovery_window_in_days = 0
  tags = {
    provisioner = var.provisioner
    environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "db-secrets-manager" {
    depends_on = [
        aws_db_instance.database
    ]
    secret_id = aws_secretsmanager_secret.secret-name.id
    secret_string = "${aws_db_instance.database.endpoint};${var.db_user};${var.db_password};${var.db_name}"
  
}