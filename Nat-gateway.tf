# Create Elastic IP (AZ-1)
resource "aws_eip" "Project-EIP-1" {
  vpc = var.EIP
}

# Create Elastic IP (AZ-2)
resource "aws_eip" "Project-EIP-2" {
  vpc = var.EIP
}

# Create NAT gateway 1 (AZ-1)
resource "aws_nat_gateway" "Nat-gateway-1" {
  allocation_id = aws_eip.Project-EIP-1.id
  subnet_id     = aws_subnet.public-sub1.id

  tags = {
    Name = var.environment_name
  }
}

# Create NAT gateway 2 (AZ-2)
resource "aws_nat_gateway" "Nat-gateway-2" {
  allocation_id = aws_eip.Project-EIP-2.id
  subnet_id     = aws_subnet.public-sub2.id

  tags = {
    Name = var.environment_name
  }
}


# Associating NAT gateway 1 with private route table 1 for AZ 1
resource "aws_route" "Nat-association-1" {
  route_table_id         = aws_route_table.private-route-table1.id
  nat_gateway_id         = aws_nat_gateway.Nat-gateway-1.id
  destination_cidr_block = "0.0.0.0/0"
}

# Associating NAT gateway 1 with private route table 2 for AZ 2
resource "aws_route" "Nat-association-2" {
  route_table_id         = aws_route_table.private-route-table2.id
  nat_gateway_id         = aws_nat_gateway.Nat-gateway-2.id
  destination_cidr_block = "0.0.0.0/0"
}