# Creating Launch templete for webservers
resource "aws_launch_template" "Webserver-Launch-Template" {
  name_prefix   = "Webtier-Launch-Template"
  image_id      = var.instance-ami
  instance_type = var.instance-type
  key_name      = var.instance-key
  /* security_group_names = [ "Webtier-SG" ] */
  user_data = filebase64("${"install_apache.sh"}")

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.Webtier-SG.id]
  }

}


# Creating Launch templete for Appservers
resource "aws_launch_template" "Appserver-Launch-Template" {
  name_prefix   = "Apptier-Launch-Template"
  image_id      = var.instance-ami
  instance_type = var.instance-type
  key_name      = var.instance-key

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.App-tier-SG.id]
  }

}
