# Public subnet 1 (web tier)
resource "aws_subnet" "public-sub1" {
  vpc_id            = aws_vpc.Project-VPC.id
  cidr_block        = var.cidr-for-public-sub1
  availability_zone = var.AZ-1

  tags = {
    Name = var.environment_name
  }
}

# Public subnet 2 (web tier)
resource "aws_subnet" "public-sub2" {
  vpc_id            = aws_vpc.Project-VPC.id
  cidr_block        = var.cidr-for-public-sub2
  availability_zone = var.AZ-2

  tags = {
    Name = var.environment_name
  }
}

# Private subnet 1 (Application tier)
resource "aws_subnet" "private-sub1" {
  vpc_id            = aws_vpc.Project-VPC.id
  cidr_block        = var.cidr-for-private-sub1
  availability_zone = var.AZ-1

  tags = {
    Name = var.environment_name
  }
}


# Private subnet 2 (Application tier)
resource "aws_subnet" "private-sub2" {
  vpc_id            = aws_vpc.Project-VPC.id
  cidr_block        = var.cidr-for-private-sub2
  availability_zone = var.AZ-2

  tags = {
    Name = var.environment_name
  }
}

# Private subnet 3 (Database tier)
resource "aws_subnet" "private-sub3" {
  vpc_id            = aws_vpc.Project-VPC.id
  cidr_block        = var.cidr-for-private-sub3
  availability_zone = var.AZ-1

  tags = {
    Name = var.environment_name
  }
}

# Private subnet 4 (Database tier)
resource "aws_subnet" "private-sub4" {
  vpc_id            = aws_vpc.Project-VPC.id
  cidr_block        = var.cidr-for-private-sub4
  availability_zone = var.AZ-2

  tags = {
    Name = var.environment_name
  }
}


