# MYSQL RDS
# Create database subnet group

resource "aws_db_subnet_group" "rds_mysql_subnet_group" {
  name       = var.rds_mysql_subnet_group_name
  subnet_ids = [aws_subnet.private-sub3.id, aws_subnet.private-sub4.id]

  tags = {
    Name = var.environment_name
  }
}


resource "aws_db_instance" "Project_sql" {
  allocated_storage = var.mysql_allocated_storage
  /* db_name             = var.mysql_db_name */
  engine                 = "mysql"
  engine_version         = var.mysql_engine_version
  instance_class         = var.mysql_instance_class
  username               = var.mysql_username
  password               = var.mysql_password
  storage_type           = var.mysql_storage_type
  publicly_accessible    = var.mysql_publicly_accessible
  vpc_security_group_ids = [aws_security_group.DB-tier-SG.id]
  skip_final_snapshot    = var.mysql_skip_final_snapshot
  db_subnet_group_name   = aws_db_subnet_group.rds_mysql_subnet_group.id
  multi_az               = var.multi-az-deployment
  tags = {
    name = var.environment_name
  }
}


# other parameters that could be included
#parameter_group_name = "default.mysql5.7"
# vpc_id
