resource "aws_db_subnet_group" "subnet_group" {
  name       = var.subnet-group-name
  subnet_ids = var.private_subnets
}

resource "aws_rds_cluster" "aurora_mysql" {
  cluster_identifier = "aurora-mysql-cluster"
  engine             = var.engine
  engine_version     = "8.0.mysql_aurora.3.04.0"
  database_name      = var.db_name

  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  manage_master_user_password = true
  master_username             = var.db_username
  skip_final_snapshot         = true
}


resource "aws_rds_cluster_instance" "aurora_instances" {
  count                = 1
  identifier           = "aurora-instance-${count.index}"
  cluster_identifier   = aws_rds_cluster.aurora_mysql.id
  instance_class       = "db.t3.medium"
  engine               = aws_rds_cluster.aurora_mysql.engine
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
  publicly_accessible  = false
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL from Web SG"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}