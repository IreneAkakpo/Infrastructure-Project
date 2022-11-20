
#Creating Internet-facing ALB for Webservers
resource "aws_lb" "External-lb" {
  name                       = var.ext_lb_name
  internal                   = false
  ip_address_type            = var.ip_address_type
  load_balancer_type         = var.load_balancer_type
  security_groups            = [aws_security_group.Web-ELB-SG.id]
  subnets                    = [aws_subnet.public-sub1.id, aws_subnet.public-sub2.id]
  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    name = var.environment_name
  }
}

# Creating listener
resource "aws_lb_listener" "alb-listener1" {
  load_balancer_arn = aws_lb.External-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Webtier-Target-group.arn
  }
}


#Creating Internal ALB for App servers
resource "aws_lb" "Internal-lb" {
  name                       = var.int_lb_name
  internal                   = true
  ip_address_type            = var.ip_address_type
  load_balancer_type         = var.load_balancer_type
  security_groups            = [aws_security_group.Internal-ELB-SG.id]
  subnets                    = [aws_subnet.private-sub1.id, aws_subnet.private-sub2.id]
  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    name = var.environment_name
  }
}


# Creating listener
resource "aws_lb_listener" "alb-listener2" {
  load_balancer_arn = aws_lb.Internal-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Apptier-Target-group.arn
  }
}


