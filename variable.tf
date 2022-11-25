#Making Region name variable
variable "region-name" {
  description = "making region name a variable"
  default     = "eu-west-2"
  type        = string

}

#Making VPC Name/tag variable
variable "vpc_name" {
  description = "making vpc-name a variable"
  default     = "Project-VPC"
  type        = string

}

#Making Cidr block variable
variable "cidr-for-vpc" {
  description = "making cidr a variable"
  default     = "10.0.0.0/16"
  type        = string

}

#Making DNS hostnames variable
variable "enable_dns_hostnames" {
  description = "making enable dns hostnames a variable"
  default     = "true"
  type        = bool

}

#Making DNS support variable
variable "enable_dns_support" {
  description = "making enable dns support a variable"
  default     = "true"
  type        = bool

}

#Making Tag Name support variable
variable "environment_name" {
  description = "making environment tag name a variable"
  default     = "Development"
  type        = string

}

# Availability Zone Variable 1
variable "AZ-1" {
  description = "availability zone"
  default     = "eu-west-2a"
  type        = string
}


# Availability Zone Variable 2
variable "AZ-2" {
  description = "availability zone"
  default     = "eu-west-2b"
  type        = string
}

# Public subnet1 variable
variable "cidr-for-public-sub1" {
  description = "making public subnet1 cidr a variable"
  default     = "10.0.1.0/24"
  type        = string

}

# Public subnet2 variable
variable "cidr-for-public-sub2" {
  description = "making public subnet2 cidr a variable"
  default     = "10.0.2.0/24"
  type        = string

}

# Private subnet1 variable
variable "cidr-for-private-sub1" {
  description = "making private subnet1 cidr a variable"
  default     = "10.0.3.0/24"
  type        = string

}

# Private subnet2 variable
variable "cidr-for-private-sub2" {
  description = "making private subnet1 cidr a variable"
  default     = "10.0.4.0/24"
  type        = string

}

# Private subnet3 variable
variable "cidr-for-private-sub3" {
  description = "making private subnet3 cidr a variable"
  default     = "10.0.5.0/24"
  type        = string

}

# Private subnet4 variable
variable "cidr-for-private-sub4" {
  description = "making private subnet4 cidr a variable"
  default     = "10.0.6.0/24"
  type        = string

}

# Internet Gateway Name/tag variable
variable "internet_gateway_name" {
  description = "making IGW-name a variable"
  default     = "Project-IGW"
  type        = string

}


#EIP for VPC status
variable "EIP" {
  description = "making eip for vpc a variable"
  default     = "true"
  type        = bool

}

# Web tier Security group name variable 
variable "Web_ELB_SG_name" {
  description = "making security group name a variable"
  default     = "Web-ELB-SG"
  type        = string

}

# Web tier Security group name variable 
variable "Webtier_SG_name" {
  description = "making security group name a variable"
  default     = "Webtier-SG"
  type        = string

}

# App tier Security group name variable 
variable "Internal_ELB_SG_name" {
  description = "making security group name a variable"
  default     = "Internal-ELB-SG"
  type        = string

}

# App tier Security group name variable 
variable "Apptier_SG_name" {
  description = "making security group name a variable"
  default     = "App-tier-SG"
  type        = string

}

# DB tier Security group name variable 
variable "DB_SG_name" {
  description = "making security group name a variable"
  default     = "DB-tier-SG"
  type        = string

}

#RDS VARIABLES

variable "rds_mysql_subnet_group_name" {
  description = "making rds_mysql_subnet_group_name a variable"
  default     = "rds_mysql_subnet_group"
  type        = string
}

variable "mysql_allocated_storage" {
  description = "making mysql allocated_storage a variable"
  default     = 10
  type        = number
}

/* variable "mysql_db_name" {
  description = "making mysql db_name a variable"
  default     = "mydb"
  type        = string
} */

variable "mysql_engine_version" {
  description = "making mysql engine_version a variable"
  default     = "8.0.28"
  type        = string
}

variable "mysql_instance_class" {
  description = "making mysql instance_class a variable"
  default     = "db.t3.micro"
  type        = string
}

variable "mysql_username" { #safer to keep in aws secret manager
  description = "making mysql username a variable"
  default   = "Rennie"
  type        = string

}

variable "mysql_password" { #safer to keep in aws secret manager
  description = "making mysql password a variable"
  default   = "wordpass"
  type        = string
}

variable "mysql_storage_type" {
  description = "making mysql storage_type a variable"
  default     = "gp2"
  type        = string
}

variable "mysql_publicly_accessible" {
  description = "making mysql publicly_accessible a variable"
  default     = false
  type        = bool
}

variable "mysql_skip_final_snapshot" {
  description = "making mysql skip_final_snapshot a variable"
  default     = true
  type        = bool
}

variable "multi-az-deployment" {
  description = "create a standby DB instance"
  default     = true
  type        = bool
}


# Load balancer target group name a variable
variable "Webtier_TG_name" {
  description = "making target group name a variable"
  default     = "Webtier-elb-tg"
  type        = string
}

# Load balancer target group name a variable
variable "Apptier_TG_name" {
  description = "making target group name a variable"
  default     = "Apptier-elb-tg"
  type        = string
}

# Target group target-type a variable
variable "target_type" {
  description = "making target group target_type a variable"
  default     = "instance"
  type        = string
}

# Load balancer name a variable
variable "ext_lb_name" {
  description = "making target group name a variable"
  default     = "Project-Alb"
  type        = string
}

# Load balancer name a variable
variable "int_lb_name" {
  description = "making target group name a variable"
  default     = "Internal-Alb"
  type        = string
}

# Load balancer ip_address_type a variable
variable "ip_address_type" {
  description = "making alb ip_address_type a variable"
  default     = "ipv4"
  type        = string
}

# Load balancer type a variable
variable "load_balancer_type" {
  description = "making load_balancer_type a variable"
  default     = "application"
  type        = string
}


#Deletion protection variable
variable "enable_deletion_protection" {
  description = "making enable_deletion_protection a variable"
  default     = false
  type        = bool

}

# EC2 AMI variable
variable "instance-ami" {
  description = "making instance ami a variable"
  default     = "ami-0648ea225c13e0729" # eu-west-2
  type        = string

}

# EC2 instance type variable
variable "instance-type" {
  description = "making ec2 instance type a variable"
  default     = "t2.micro"
  type        = string

}

# Making EC2 Key Name a variable
variable "instance-key" { #safer to keep in aws secret manager
  description = "making instance key a variable"
  default   = "Irene-KP"
  type        = string

}


# Making health check type a variable
variable "health-check-type" {
  description = "making health check type a variable"
  default     = "ELB"
  type        = string

}