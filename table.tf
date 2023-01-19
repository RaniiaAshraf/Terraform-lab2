resource "aws_route_table" "table" {
  vpc_id =  aws_vpc.terra-vpc.id

  route {
    cidr_block = var.route-cidr
    gateway_id = aws_internet_gateway.gateway.id
  }

tags = {
    Name = var.routename
  }
}

resource "aws_route_table_association" "terra-subnet" {
  subnet_id = aws_subnet.subnet[0].id
  route_table_id = aws_route_table.table.id
}


resource "aws_route_table" "table2" {
  vpc_id =  aws_vpc.terra-vpc.id

  route {
    cidr_block = var.route-cidr
    nat_gateway_id = aws_nat_gateway.natgateway.id
  }

tags = {
    Name = var.route2-name
  }
}

resource "aws_route_table_association" "table2" {
  subnet_id = aws_subnet.subnet[1].id
  route_table_id = aws_route_table.table2.id
}



