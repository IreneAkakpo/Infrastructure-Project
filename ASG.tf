
#Configuring Auto Scaling for Web Tier
resource "aws_autoscaling_group" "Webserver-autoscaling-group" {
  name = "Webservers-ASG"
  /* availability_zones = [var.AZ-1,var.AZ-2] */
  desired_capacity          = 4
  max_size                  = 6
  min_size                  = 4
  health_check_grace_period = 300
  health_check_type         = var.health-check-type
  vpc_zone_identifier       = [aws_subnet.public-sub1.id, aws_subnet.public-sub2.id]

  launch_template {
    id      = aws_launch_template.Webserver-Launch-Template.id
    version = "$Latest"
  }
}

# Create a ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_1" {
  autoscaling_group_name = aws_autoscaling_group.Webserver-autoscaling-group.id
  alb_target_group_arn   = aws_lb_target_group.Webtier-Target-group.arn
}

resource "aws_autoscaling_group" "Appserver-autoscaling-group" {
  name = "Appservers-ASG"
  /* availability_zones = [var.AZ-1,var.AZ-2] */
  desired_capacity          = 4
  max_size                  = 6
  min_size                  = 4
  health_check_grace_period = 300
  health_check_type         = var.health-check-type
  vpc_zone_identifier       = [aws_subnet.private-sub1.id, aws_subnet.private-sub2.id]

  launch_template {
    id      = aws_launch_template.Appserver-Launch-Template.id
    version = "$Latest"
  }
}


# Create a ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_2" {
  autoscaling_group_name = aws_autoscaling_group.Appserver-autoscaling-group.id
  alb_target_group_arn   = aws_lb_target_group.Apptier-Target-group.arn
}


/* # scale up policy
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "ASG-scale-up"
  autoscaling_group_name = aws_autoscaling_group.Webserver-autoscaling-group.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1" #increasing instance by 1 
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# scale up alarm
# alarm will trigger the ASG policy (scale/down) based on the metric (CPUUtilization), comparison_operator, threshold
resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name          = "ASG-scale-up-alarm"
  alarm_description   = "asg-scale-up-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80" # New instance will be created once CPU utilization is higher than 30 %
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.Webserver-autoscaling-group.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_up.arn]
}

# scale down policy
resource "aws_autoscaling_policy" "scale_down" {
  name                   = "ASG-scale-down"
  autoscaling_group_name = aws_autoscaling_group.Webserver-autoscaling-group.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1" # decreasing instance by 1 
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# scale down alarm
resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name          = "ASG-scale-down-alarm"
  alarm_description   = "asg-scale-down-cpu-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "20" # Instance will scale down when CPU utilization is lower than 5 %
  dimensions = {
    "AutoScalingGroupName" =  aws_autoscaling_group.Webserver-autoscaling-group.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_down.arn]
} */

