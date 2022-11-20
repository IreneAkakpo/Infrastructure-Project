# Public route table (Web tier)
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.Project-VPC.id

  tags = {
    Name = var.environment_name
  }
}


# Private route table (Availability 1- eu-west-2a)
resource "aws_route_table" "private-route-table1" {
  vpc_id = aws_vpc.Project-VPC.id

  tags = {
    Name = var.environment_name
  }
}

# Private route table (Availability 2- eu-west-2b)
resource "aws_route_table" "private-route-table2" {
  vpc_id = aws_vpc.Project-VPC.id

  tags = {
    Name = var.environment_name
  }
}


# Public route table associations (Web tier)
resource "aws_route_table_association" "public-route-table-association" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.public-sub2.id
  route_table_id = aws_route_table.public-route-table.id
}


# Private route table association (Availabilty zone 1)
resource "aws_route_table_association" "private-route-table1-association" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route-table1.id
}

resource "aws_route_table_association" "private-route-table1-association-2" {
  subnet_id      = aws_subnet.private-sub3.id
  route_table_id = aws_route_table.private-route-table1.id
}

# # Private route table association (Availabilty zone 1)
resource "aws_route_table_association" "private-route-table2-association" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private-route-table2.id
}

resource "aws_route_table_association" "private-route-table2-association-2" {
  subnet_id      = aws_subnet.private-sub4.id
  route_table_id = aws_route_table.private-route-table2.id
}
