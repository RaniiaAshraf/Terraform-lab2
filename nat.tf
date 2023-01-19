resource "aws_eip" "elastic-ip" {
  vpc      = true
}

resource "aws_nat_gateway" "natgateway" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.subnet[0].id

  tags = {
    Name = var.natgaeway-name
  }

  depends_on = [aws_internet_gateway.gateway]

  
}