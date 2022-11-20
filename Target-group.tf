# Creating Web servers target group
resource "aws_lb_target_group" "Webtier-Target-group" {
  name        = var.Webtier_TG_name
  target_type = var.target_type
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.Project-VPC.id

  health_check {
    interval            = 100
    path                = "/"
    protocol            = "HTTP"
    timeout             = 60
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  tags = {
    Name = var.environment_name
  }
}

# Creating App servers target group
resource "aws_lb_target_group" "Apptier-Target-group" {
  name        = var.Apptier_TG_name
  target_type = var.target_type
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.Project-VPC.id

  health_check {
    interval            = 100
    path                = "/"
    protocol            = "HTTP"
    timeout             = 60
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }


  tags = {
    Name = var.environment_name
  }
}
