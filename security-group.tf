# Configuring internet-facing Load balancer Security Group
resource "aws_security_group" "Web-ELB-SG" {
  name        = var.Web_ELB_SG_name
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Project-VPC.id

  # Inbound Rules
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.environment_name
  }
}


# Configuring Web tier Security Group (Public EC2 Instances)
resource "aws_security_group" "Webtier-SG" {
  name        = var.Webtier_SG_name
  description = "Allow inbound traffic from HTTP, SSH and Web-ELB-SG"
  vpc_id      = aws_vpc.Project-VPC.id

  # Inbound Rules
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.Web-ELB-SG.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    /* security_groups = [aws_security_group.Web-ELB-SG.id] */
  }

  tags = {
    Name = var.environment_name
  }
}

# Configuring Internal Load balancer Security Group
resource "aws_security_group" "Internal-ELB-SG" {
  name        = var.Internal_ELB_SG_name
  description = "Allow inbound traffic from Webtier-SG"
  vpc_id      = aws_vpc.Project-VPC.id

  ingress {
    description     = "Webtier-SG from VPC"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.Webtier-SG.id]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    /* cidr_blocks     = ["0.0.0.0/0"] */
    security_groups = [aws_security_group.Webtier-SG.id]
  }

  tags = {
    Name = var.environment_name
  }
}


# Configuring App tier Security Group
resource "aws_security_group" "App-tier-SG" {
  name        = var.Apptier_SG_name
  description = "Allow inbound traffic from Internal-ELB-SG"
  vpc_id      = aws_vpc.Project-VPC.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.Internal-ELB-SG.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.environment_name
  }
}



# Configuring MY SQL Security Group
resource "aws_security_group" "DB-tier-SG" {
  name        = var.DB_SG_name
  description = "Allow inbound traffic from App-tier-SG"
  vpc_id      = aws_vpc.Project-VPC.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.App-tier-SG.id]
  }

  tags = {
    Name = var.environment_name
  }
}