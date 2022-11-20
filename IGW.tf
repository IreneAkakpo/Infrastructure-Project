# Internet gateway
resource "aws_internet_gateway" "Project-IGW" {
  vpc_id = aws_vpc.Project-VPC.id

  tags = {
    Name = var.environment_name
  }
}

# AWS Route IGW-Public route table
resource "aws_route" "Project-igw-association" {
  route_table_id         = aws_route_table.public-route-table.id
  gateway_id             = aws_internet_gateway.Project-IGW.id
  destination_cidr_block = "0.0.0.0/0"
}